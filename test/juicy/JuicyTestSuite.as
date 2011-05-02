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
package juicy {
	import juicy.net.URLLoaderServiceTestCase;
	import asunit.framework.TestSuite;

	import juicy.collections.mutable.ArrayListTestCase;
	import juicy.collections.mutable.ListTestCase;

	/**
	 * @author Johannes Hodde
	 */
	public class JuicyTestSuite extends TestSuite {

		public function JuicyTestSuite() {
			super();

			// Collection
			// ==========
			// List
			addTest(new ListTestCase("testSize"));
			addTest(new ListTestCase("testContains"));
			addTest(new ListTestCase("testAdd"));
			addTest(new ListTestCase("testRemove"));
			addTest(new ListTestCase("testModify"));
			addTest(new ListTestCase("testFilter"));
			addTest(new ListTestCase("testAddBefore"));
			addTest(new ListTestCase("testAddAfter"));
			addTest(new ListTestCase("testRemoveAt"));
			addTest(new ListTestCase("testGetAt"));
			addTest(new ListTestCase("testGetAtOrElse"));
			addTest(new ListTestCase("testIterator"));

			// ArrayList
			addTest(new ArrayListTestCase("testSize"));
			addTest(new ArrayListTestCase("testContains"));
			addTest(new ArrayListTestCase("testAdd"));
			addTest(new ArrayListTestCase("testRemove"));
			addTest(new ArrayListTestCase("testModify"));
			addTest(new ArrayListTestCase("testFilter"));
			addTest(new ArrayListTestCase("testAddBefore"));
			addTest(new ArrayListTestCase("testAddAfter"));
			addTest(new ArrayListTestCase("testRemoveAt"));
			addTest(new ArrayListTestCase("testGetAt"));
			addTest(new ArrayListTestCase("testGetAtOrElse"));
			addTest(new ArrayListTestCase("testIterator"));

			// Net
			// ==========
			// URLLoaderService
			addTest(new URLLoaderServiceTestCase("testAddDataClient"));
			addTest(new URLLoaderServiceTestCase("testRemoveDataClient"));
			addTest(new URLLoaderServiceTestCase("testLoad"));
		}
	}
}
