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
	import juicy.collections.AbstractListTestCase;

	/**
	 * @author Johannes Hodde
	 */
	public class ArrayListTestCase extends AbstractListTestCase {

		public function ArrayListTestCase(testMethod : String = null) {
			super(new ArrayList(), testMethod);
		}
	}
}