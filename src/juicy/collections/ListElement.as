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
package juicy.collections {

	/**
	 * The <code>ListElement</code> is used by <code>IList</code>
	 * implementations.
	 * Each <code>ListElement</code> wraps some sort of data and stores
	 * a reference to a previous and next <code>ListElement</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public final class ListElement {

		public var data : *;
		public var previous : ListElement;
		public var next : ListElement;

		/**
		 * Creates a new <code>ListElement</code>.
		 * 
		 * @param data the data to wrap.
		 * @param previous the previous <code>ListElement</code>.
		 * @param next the next <code>ListElement</code>.
		 */
		public function ListElement(data : *, previous : ListElement = null, next : ListElement = null) {
			this.data = data;
			this.previous = previous;
			this.next = next;
		}
	}
}
