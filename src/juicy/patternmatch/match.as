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
package juicy.patternmatch {

	/**
	 * @author Johannes Hodde
	 */
	public function match(object : *) : Function {
		return function(pattern : Function, resultHandler : Function) : Function {
			if(pattern(object)) {
				resultHandler(object);

				var f : Function = function(f1 : Function, f2 : Function) : Function {
					return f;
				};

				return f;
			} else {
				return match(object);
			}
		};
	}
}