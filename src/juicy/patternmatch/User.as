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
	public class User implements IExtractable {

		private var _name : String;
		private var _surname : String;
		private var _age : uint;

		public function User(name : String, surname : String, age : uint) {
			_name = name;
			_surname = surname;
			_age = age;
		}
		
		public function extract(resultHandler : Function) : Boolean {
			try {
				resultHandler(_name, _surname, _age);
			} catch(error : Error) {
				return false;
			}
		}
	}
}
