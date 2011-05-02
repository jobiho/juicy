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
package juicy.collections.mutable {
	import juicy.collections.ICollection;
	import juicy.collections.IList;
	import juicy.collections.filter.ICollectionFilter;
	import juicy.collections.iterator.IIterator;
	import juicy.collections.iterator.ListIterator;
	import juicy.collections.modifier.ICollectionModifier;

	/**
	 * <code>ArrayList</code> is an <code>IList</code> implementation wrapping
	 * an <code>Array</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public class ArrayList implements IList {

		protected const _array : Array = [];

		/**
		 * Creates a new <code>ArrayList</code>.
		 */
		public function ArrayList() {}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function addBefore(data : *, index : uint) : IList {
			if(_array.length == 0 && index == 0) {
				_array[0] = data;
			} else if(index >= _array.length) {
				throw new ArgumentError("Specified index " + index + " is out of bounce.");

				return this;
			}

			_array.splice(index, 0, data);

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function addAfter(data : *, index : uint) : IList {
			if(_array.length == 0 && index == 0) {
				_array[0] = data;
			} else if(index >= _array.length) {
				throw new ArgumentError("Specified index " + index + " is out of bounce.");

				return this;
			}

			_array.splice(index + 1, 0, data);

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function removeAt(index : uint) : IList {
			if(index >= _array.length) {
				throw new ArgumentError("Specified index " + index + " is out of bounce.");

				return this;
			}

			_array.splice(index, 1);

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function getAt(index : uint) : * {
			if(index >= _array.length) {
				throw new ArgumentError("Specified index " + index + " is out of bounce.");

				return null;
			}

			return _array[index];
		}

		/**
		 * @inheritDoc
		 */
		public function getAtOrElse(index : uint, defalutValue : * = null) : * {
			if(index >= _array.length) {
				return defalutValue;
			}

			return _array[index];
		}

		/**
		 * @inheritDoc
		 */
		public function add(data : *) : ICollection {
			_array.push(data);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function remove(data : *) : ICollection {
			for(var i : int = 0; i < _array.length; ++i) {
				if(_array[i] == data) {
					_array.splice(i, 1);

					return this;
				}
			}

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function modify(collectionModifier : ICollectionModifier) : ICollection {
			for(var i : int = 0; i < _array.length; ++i) {
				_array[i] = collectionModifier.modify(_array[i]);
			}

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function filter(collectionFilter : ICollectionFilter) : ICollection {
			var returnValue : ICollection = new ArrayList();

			for(var i : int = 0; i < _array.length; ++i) {
				if(collectionFilter.filter(_array[i])) {
					returnValue.add(_array[i]);
				}
			}

			return returnValue;
		}

		/**
		 * @inheritDoc
		 */
		public function contains(data : *) : Boolean {
			for(var i : int = 0; i < _array.length; ++i) {
				if(_array[i] == data) {
					return true;
				}
			}

			return false;
		}

		/**
		 * @inheritDoc
		 */
		public function toString() : String {
			var str : String = "";
			for(var i : int = 0; i < _array.length; ++i) {
				if(str != "") {
					str += ",";
					str += _array[i];
				}
			}

			return str;
		}

		/**
		 * @inheritDoc
		 */
		public function get size() : uint {
			return _array.length;
		}

		/**
		 * @inheritDoc
		 */
		public function get iterator() : IIterator {
			return new ListIterator(this);
		}
	}
}
