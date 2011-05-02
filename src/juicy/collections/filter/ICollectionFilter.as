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
package juicy.collections.filter {

	/**
	 * <code>ICollectionFilter</code>s are used to filter
	 * <code>ICollection</code>s via it's <code>filter</code> method.
	 * When calling <code>filter</code> each data will be passed to the
	 * specified <code>ICollectionFilter</code>.
	 * If the <code>ICollectionFilter</code> returns true for some data,
	 * it will be added to a newly created <code>ICollection</code> which
	 * will be finally returned.
	 * 
	 * @author Johannes Hodde
	 */
	public interface ICollectionFilter {

		/**
		 * Is called by an <code>ICollection</code> for each data it contains.
		 * 
		 * @param data the data passed in by <code>ICollection</code>s.
		 * @return wheter or not the specified data matches this
		 * <code>ICollectionFilter</code>.
		 */
		function filter(data : *) : Boolean;
	}
}
