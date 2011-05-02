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

	/**
	 * <code>IIterator</code> provides an API for iterating over a set of data.
	 * 
	 * @author Johannes Hodde
	 */
	public interface IIterator {

		/**
		 * @return wheter or not there is a next element.
		 */
		function hasNext() : Boolean;

		/**
		 * @return the next element.
		 */
		function get next() : *;
	}
}
