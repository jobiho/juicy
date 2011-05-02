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
package juicy.collections.modifier {

	/**
	 * <code>ICollectionModifier</code>s are used to modify data
	 * in a <code>ICollection</code> via it's <code>modify</code> method.
	 * When calling <code>modify</code> each data will be passed to the
	 * specified <code>ICollectionModifier</code> and replaced by it's return
	 * value.
	 * 
	 * @author Johannes Hodde
	 */
	public interface ICollectionModifier {

		/**
		 * Is called by an <code>ICollection</code> for each data it contains.
		 * 
		 * @param data the data passed in by <code>ICollection</code>s.
		 * @return the modified data.
		 */
		function modify(data : *) : *;
	}
}
