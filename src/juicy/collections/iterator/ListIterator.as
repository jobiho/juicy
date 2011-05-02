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
package juicy.collections.iterator {
	import juicy.collections.IList;

	/**
	 * <code>ListIterator</code> is an <code>IIterator</code> for iterating
	 * over <code>IList</code>s.
	 * 
	 * @author Johannes Hodde
	 */
	public class ListIterator implements IIterator {

		protected var _list : IList;
		protected var _pointer : uint = 0;

		/**
		 * Creates a new <code>ListIterator</code>.
		 * 
		 * @param list the <code>IList</code> to iterate over.
		 */
		public function ListIterator(list : IList) {
			_list = list;
		}

		/**
		 * @inheritDoc
		 */
		public function hasNext() : Boolean {
			return _pointer < _list.size;
		}

		/**
		 * @inheritDoc
		 */
		public function get next() : * {
			return _list.getAt(_pointer++);
		}
	}
}
