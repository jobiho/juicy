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
	import juicy.collections.filter.ICollectionFilter;
	import juicy.collections.ICollection;
	import juicy.collections.modifier.ICollectionModifier;
	import juicy.collections.IList;
	import juicy.collections.ListElement;
	import juicy.collections.iterator.IIterator;
	import juicy.collections.iterator.ListIterator;

	/**
	 * <code>List</code> is a double linked list implementation of
	 * <code>IList</code>.
	 * This <code>List</code> is mutable which means adding or removing
	 * data to or from this <code>List</code> modifies the original
	 * <code>List</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public class List implements IList {

		protected var _head : ListElement;
		protected var _tail : ListElement;
		protected var _size : uint = 0;

		/**
		 * Creates a new mutable <code>List</code>.
		 */
		public function List() {}

		/**
		 * @inheritDoc
		 */
		public function add(data : *) : ICollection {
			if(_head == null) {
				_head = _tail = new ListElement(data);
			} else {
				_tail = _tail.next = new ListElement(data, _tail);
			}

			++_size;

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified data could not be found.
		 */
		public function remove(data : *) : ICollection {
			if(_size == 0) {
				throw new ArgumentError("Specified data " + data + " could not be found.");
			}

			var eachListElement : ListElement = _head;
			while(eachListElement) {
				if(eachListElement.data == data) {
					if(eachListElement == _head && eachListElement == _tail) {
						_head = _tail = null;
					} else if(eachListElement == _head) {
						_head = eachListElement.next;
						_head.previous = null;
					} else if(eachListElement == _tail) {
						_tail = eachListElement.previous;
						_tail.next = null;
					} else {
						eachListElement.previous.next = eachListElement.next;
						eachListElement.next.previous = eachListElement.previous;
					}

					eachListElement.next = eachListElement.previous = null;

					--_size;

					return this;
				}

				eachListElement = eachListElement.next;
			}

			throw new ArgumentError("Specified data " + data + " could not be found.");

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function modify(collectionModifier : ICollectionModifier) : ICollection {
			var eachListElement : ListElement = _head;
			while(eachListElement) {
				eachListElement.data = collectionModifier.modify(eachListElement.data);

				eachListElement = eachListElement.next;
			}

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function filter(collectionFilter : ICollectionFilter) : ICollection {
			var returnValue : ICollection = new List();

			var eachListElement : ListElement = _head;
			while(eachListElement) {
				if(collectionFilter.filter(eachListElement.data)) {
					returnValue.add(eachListElement.data);
				}

				eachListElement = eachListElement.next;
			}

			return returnValue;
		}

		/**
		 * @inheritDoc
		 */
		public function contains(data : *) : Boolean {
			var eachListElement : ListElement = _head;
			while(eachListElement) {
				if(eachListElement.data == data) {
					return true;
				}

				eachListElement = eachListElement.next;
			}

			return false;
		}

		/**
		 * @inheritDoc
		 */
		public function get size() : uint {
			return _size;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function addBefore(data : *, index : uint) : IList {
			if(_size == 0 && index == 0) {
				_head = _tail = new ListElement(data);
			} else if(index >= _size) {
				throw new ArgumentError("Specified index " + index + " is out of bounds.");

				return this;
			} else if(index == 0) {
				_head = _head.previous = new ListElement(data, null, _head);
			} else if(index == _size - 1) {
				_tail.previous = _tail.previous.next = new ListElement(data, _tail.previous, _tail);
			} else {
				var element : ListElement = getElementAt(index);
				element.previous = element.previous.next = new ListElement(data, element.previous, element);
			}

			++_size;

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function addAfter(data : *, index : uint) : IList {
			if(_size == 0 && index == 0) {
				_head = _tail = new ListElement(data);
			} else if(index >= _size) {
				throw new ArgumentError("Specified index " + index + " is out of bounds.");

				return this;
			} else if(index == _size - 1) {
				_tail = _tail.next = new ListElement(data, _tail);
			} else if(index == 0) {
				_head.next = _head.next.previous = new ListElement(data, _head, _head.next);
			} else {
				var element : ListElement = getElementAt(index);
				element.next = element.next.previous = new ListElement(data, element, element.next);
			}

			++_size;

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function removeAt(index : uint) : IList {
			if(index >= _size) {
				throw new ArgumentError("Specified index " + index + " is out of bounds.");

				return this;
			}

			try {
				remove(getAt(index));
			} catch(error : Error) {
				throw error;
			}

			return this;
		}

		/**
		 * @inheritDoc
		 * 
		 * @throws an ArgumentError if the specified index is out of bounds.
		 */
		public function getAt(index : uint) : * {
			var element : ListElement = getElementAt(index);

			if(element == null) {
				throw new ArgumentError("Specified index " + index + " is out of bounds.");
				return null;
			}

			return element.data;
		}

		/**
		 * @inheritDoc
		 */
		public function getAtOrElse(index : uint, defaultValue : * = null) : * {
			if(index >= _size) {
				return defaultValue;
			}

			return getAt(index);
		}

		/**
		 * @inheritDoc
		 */
		public function get iterator() : IIterator {
			return new ListIterator(this);
		}

		/**
		 * @private
		 * 
		 * Returns the ListElement at the specified index.
		 */
		protected function getElementAt(index : uint) : ListElement {
			if(_size == 0 || index >= _size) {
				return null;
			}

			var i : uint;
			var eachListElement : ListElement;
			if(index > _size >> 1) {
				i = _size - 1;
				eachListElement = _tail;

				while(eachListElement) {
					if(i == index) {
						return eachListElement;
					}
	
					eachListElement = eachListElement.previous;
					--i;
				}
			} else {
				i = 0;
				eachListElement = _head;

				while(eachListElement) {
					if(i == index) {
						return eachListElement;
					}
	
					eachListElement = eachListElement.next;
					++i;
				}
			}

			return null;
		}

		/**
		 * @inheritDoc
		 */
		public function toString() : String {
			var str : String = "";

			var eachListElement : ListElement = _head;
			while(eachListElement) {
				if(str != "") {
					str += ",";
				}
				str += eachListElement.data;

				eachListElement = eachListElement.next;
			}

			return str;
		}
	}
}