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
package juicy.collections.mutable.factory {
	import juicy.collections.mutable.ArrayList;

	/**
	 * @author Johannes Hodde
	 */
	public function arrayList(...data) : ArrayList {
		var returnValue : ArrayList = new ArrayList();

		for(var i : int = 0; i < data.length; ++i) {
			returnValue.add(data[i]);
		}

		return returnValue;
	}
}
