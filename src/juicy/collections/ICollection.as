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
	import juicy.collections.filter.ICollectionFilter;
	import juicy.collections.modifier.ICollectionModifier;
	import juicy.collections.iterator.IIterable;

	/**
	 * <code>ICollection</code> is the base for any collection.
	 * 
	 * @author Johannes Hodde
	 */
	public interface ICollection extends IIterable {

		/**
		 * Adds the specified data to this <code>ICollection</code>.
		 * 
		 * @param data the data to add.
		 * @return the <code>ICollection</code>.
		 * Note that mutable <code>ICollection</code>s modify and return the
		 * original <code>ICollection</code> whereas immutable
		 * <code>ICollection</code>s return a modified copy.
		 */
		function add(data : *) : ICollection;

		/**
		 * Removes the specified data from this <code>ICollection</code>.
		 * 
		 * @param data the data to remove.
		 * @return the <code>ICollection</code>.
		 * Note that mutable <code>ICollection</code>s modify and return the
		 * original <code>ICollection</code> whereas immutable
		 * <code>ICollection</code>s return a modified copy.
		 */
		function remove(data : *) : ICollection;

		/**
		 * Calls the specified <code>ICollectionModifier</code> on each
		 * data of this <code>ICollection</code>.
		 * 
		 * @param collectionModifier the <code>ICollectionModifier</code>
		 * beeing called on each data of this <code>ICollection</code>.
		 * @return the modified <code>ICollection</code>.
		 */
		function modify(collectionModifier : ICollectionModifier) : ICollection;

		/**
		 * Calls the specified <code>ICollectionFilter</code> on each
		 * data of this <code>ICollection</code>.
		 * 
		 * @param collectionFilter the <code>ICollectionFilter</code>
		 * beeing called on each data of this <code>ICollection</code>.
		 * @return a new <code>ICollection</code> only containing the
		 * data previously beeing filtered by the specified
		 * <code>ICollectionFilter</code>.
		 */
		function filter(collectionFilter : ICollectionFilter) : ICollection;

		/**
		 * @param data the data to check for.
		 * @return wheter or not this <code>ICollection</code> contains
		 * the specified data.
		 */
		function contains(data : *) : Boolean;

		/**
		 * @return the size of this <code>ICollection</code>.
		 */
		function get size() : uint;

		/**
		 * @return a <code>String</code> represantation of this
		 * <code>ICollection</code>.
		 */
		function toString() : String;
	}
}