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
	import juicy.collections.iterator.IIterator;
	import juicy.collections.mutable.List;

	/**
	 * <code>AbstractDataProvider</code> is a basic implementation of
	 * <code>IDataProvider</code>.
	 * It implements the functionality for adding and removing
	 * <code>IDataClient</code>s.
	 * 
	 * @author Johannes Hodde
	 */
	public class AbstractDataProvider implements IDataProvider {

		protected var _collection : ICollection;

		/**
		 * Creates a new <code>AbstractDataProvider</code>.
		 * 
		 * @param collection the <code>ICollection</code> to use for
		 * managing <code>IDataClient</code>s.
		 * By default an <code>List</code> is used.
		 */
		public function AbstractDataProvider(collection : ICollection = null) {
			_collection = collection || new List();
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified <code>IDataClient</code>
		 * already has been added.
		 */
		public function addDataClient(dataClient : IDataClient) : void {
			if(_collection.contains(dataClient)) {
				throw new ArgumentError("The DataClient " + dataClient + " has already been added.");

				return;
			}

			_collection.add(dataClient);
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified <code>IDataClient</code>
		 * could not be found.
		 */
		public function removeDataClient(dataClient : IDataClient) : void {
			if(!_collection.contains(dataClient)) {
				throw new ArgumentError("The DataClient " + dataClient + " could not be found.");

				return;
			}

			_collection.remove(dataClient);
		}

		/**
		 * @private
		 * 
		 * Calls result on each registered DataClient.
		 */
		protected function callResult(data : *) : void {
			var iterator : IIterator = _collection.iterator;
			while(iterator.hasNext()) {
				IDataClient(iterator.next).result(this, data);
			}
		}

		/**
		 * @private
		 * 
		 * Calls fail on each registered DataClient.
		 */
		protected function callFail(error : Error) : void {
			var iterator : IIterator = _collection.iterator;
			while(iterator.hasNext()) {
				IDataClient(iterator.next).fail(this, error);
			}
		}

		/**
		 * @private
		 * 
		 * Calls progress on each registered DataClient.
		 */
		protected function callProgress(progress : Number) : void {
			var iterator : IIterator = _collection.iterator;
			while(iterator.hasNext()) {
				IDataClient(iterator.next).progress(this, progress);
			}
		}
	}
}
