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
	 * <code>IList</code> is an <code>ICollection</code> that stores data
	 * in a list.
	 * Data can be added or removed at any valid index.
	 * 
	 * @author Johannes Hodde
	 */
	public interface IList extends ICollection {

		/**
		 * Inserts the specified data one position before the specified index.
		 * 
		 * @param data the data to insert.
		 * @param index the index to insert the data before.
		 * @return the <code>IList</code>.
		 * Note that mutable <code>IList</code>s modify and return the
		 * original <code>IList</code> whereas immutable
		 * <code>IList</code>s return a modified copy.
		 */
		function addBefore(data : *, index : uint) : IList;

		/**
		 * Inserts the specified data one position after the specified index.
		 * 
		 * @param data the data to insert.
		 * @param index the index to insert the data after.
		 * @return the <code>IList</code>.
		 * Note that mutable <code>IList</code>s modify and return the
		 * original <code>IList</code> whereas immutable
		 * <code>IList</code>s return a modified copy.
		 */
		function addAfter(data : *, index : uint) : IList;

		/**
		 * Removes the data at the specified index.
		 * 
		 * @param index the index to remove the data at.
		 * @return the <code>IList</code>.
		 * Note that mutable <code>IList</code>s modify and return the
		 * original <code>IList</code> whereas immutable
		 * <code>IList</code>s return a modified copy.
		 */
		function removeAt(index : uint) : IList;

		/**
		 * @param index the index to return the data for.
		 * @return the data at the specified index.
		 */
		function getAt(index : uint) : *;

		/**
		 * @param index the index to return the data for.
		 * @param defaultValue the value beeing returned if the element
		 * at the speicifed index could not be found.
		 * @return the data at the specified index or the speicifed
		 * returnValue if the data could not be found.
		 */
		function getAtOrElse(index : uint, defalutValue : * = null) : *;
	}
}
