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
	 * The <code>FunctionalCollectionFilter</code> wraps a
	 * <code>Function</code> reference that the filtering is
	 * delegated to.
	 * 
	 * @author Johannes Hodde
	 */
	public class FunctionalCollectionFilter implements ICollectionFilter {

		protected var _func : Function;

		/**
		 * Creates a new <code>FunctionalCollectionModifier</code>.
		 * 
		 * @param func the <code>Function</code> the modification is delegated
		 * to.
		 */
		public function FunctionalCollectionFilter(func : Function) {
			_func = func;
		}

		/**
		 * @inheritDoc
		 */
		public function filter(data : *) : Boolean {
			return _func(data);
		}
	}
}
