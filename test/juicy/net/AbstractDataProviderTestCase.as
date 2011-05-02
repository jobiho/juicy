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
package juicy.net {
	import asunit.framework.TestCase;

	/**
	 * @author Johannes Hodde
	 */
	public class AbstractDataProviderTestCase extends TestCase {

		protected var _dataProvider : IDataProvider;

		public function AbstractDataProviderTestCase(dataProvider : IDataProvider, testMethod : String = null) {
			super(testMethod);

			_dataProvider = dataProvider;
		}

		public function testAddDataClient() : void {}

		public function testRemoveDataClient() : void {}
	}
}
