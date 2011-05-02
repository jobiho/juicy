/**
 * This program is free software:
 * You can redistribute it and/or modify it under the terms of the
 * GNU Lesser General Public License as published by the Free Software Foundation,
 * either version 3 of the License, or (at your opinion) any later version
 * (http://www.gnu.org/licenses/).
 *
 * Copyright (C) 2011 Johannes Hodde
 * http://johannes-hodde.com
 */
package juicy.net {
	import juicy.collections.ICollection;

	import flash.display.Loader;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.Timer;

	/**
	 * <code>LoaderService</code> is an <code>ILoaderService</code>
	 * implementation providing an optional timeout.
	 * After the specified timeout has expired, <code>fail</code> is called
	 * for each registered <code>IDataClient</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public class LoaderService extends AbstractDataProvider implements ILoaderService {

		protected var _timeout : Number;
		protected var _timeoutTimer : Timer;
		protected var _loader : Loader;

		/**
		 * Creates a new <code>LoaderService</code>.
		 * 
		 * @param timeout the timeout in seconds.
		 * By default the timeout is set to 0 which means no timeout is
		 * involved.
		 * 
		 * @inheritDoc
		 */
		public function LoaderService(timeout : Number = 0, collection : ICollection = null) {
			super(collection);

			_timeout = timeout;
		}

		/**
		 * @inheritDoc
		 */
		public function load(urlRequest : URLRequest, loaderContext : LoaderContext = null) : void {
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			_loader.load(urlRequest);

			if(_timeout > 0) {
				_timeoutTimer = new Timer(_timeout * 1000);
				_timeoutTimer.addEventListener(TimerEvent.TIMER, onTimeoutTimer);
				_timeoutTimer.start();
			}
		}

		/**
		 * @private
		 */
		private function tearDown() : void {
			if(_timeoutTimer) {
				_timeoutTimer.stop();
				_timeoutTimer.removeEventListener(TimerEvent.TIMER, onTimeoutTimer);
				_timeoutTimer = null;
			}

			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			_loader = null;
		}

		/**
		 * @private
		 */
		private function onComplete(event : Event) : void {
			callResult(_loader);

			tearDown();
		}

		/**
		 * @private
		 */
		private function onProgress(event : ProgressEvent) : void {
			if(event.bytesTotal > 0) {
				callProgress(event.bytesLoaded / event.bytesTotal);
			}
		}

		/**
		 * @private
		 */
		private function onError(event : SecurityErrorEvent) : void {
			tearDown();

			switch(event.type) {
				case IOErrorEvent.IO_ERROR:
					callFail(new IOError(event.text));

					break;
				case SecurityErrorEvent.SECURITY_ERROR:
					callFail(new SecurityError(event.text));

					break;
				default:
					callFail(new Error("Data could not be loaded."));

					break;
			}
		}

		/**
		 * @private
		 */
		private function onTimeoutTimer(event : TimerEvent) : void {
			tearDown();

			callFail(new Error("Timeout of " + _timeout + " has expired."));
		}
	}
}
