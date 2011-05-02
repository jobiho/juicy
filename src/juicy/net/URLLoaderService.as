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
	import flash.events.ProgressEvent;
	import flash.errors.IOError;
	import flash.events.TimerEvent;
	import juicy.collections.ICollection;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;

	/**
	 * <code>URLLoaderService</code> is an <code>IURLLoaderService</code>
	 * implementation providing an optional timeout.
	 * After the specified timeout has expired, <code>fail</code> is called
	 * for each registered <code>IDataClient</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public class URLLoaderService extends AbstractDataProvider implements IURLLoaderService {

		protected var _timeout : Number;
		protected var _timeoutTimer : Timer;
		protected var _urlLoader : URLLoader;

		/**
		 * Creates a new <code>URLLoaderService</code>.
		 * 
		 * @param timeout the timeout in seconds.
		 * By default the timeout is set to 0 which means no timeout is
		 * involved.
		 * 
		 * @inheritDoc
		 */
		public function URLLoaderService(timeout : Number = 0, collection : ICollection = null) {
			super(collection);

			_timeout = timeout;
		}

		/**
		 * @inheritDoc
		 */
		public function load(urlRequest : URLRequest) : void {
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onComplete);
			_urlLoader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			_urlLoader.load(urlRequest);

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

			_urlLoader.removeEventListener(Event.COMPLETE, onComplete);
			_urlLoader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			_urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			_urlLoader = null;
		}

		/**
		 * @private
		 */
		private function onComplete(event : Event) : void {
			callResult(_urlLoader.data);

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
