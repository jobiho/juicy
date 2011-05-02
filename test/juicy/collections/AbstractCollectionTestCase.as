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
	import juicy.collections.filter.FunctionalCollectionFilter;
	import juicy.collections.modifier.FunctionalCollectionModifier;
	import asunit.framework.TestCase;

	
	import juicy.collections.iterator.IIterator;

	/**
	 * @author Johannes Hodde
	 */
	public class AbstractCollectionTestCase extends TestCase {

		protected var _collection : ICollection;

		public function AbstractCollectionTestCase(collection : ICollection, testMethod : String = null) {
			super(testMethod);

			_collection = collection;
		}

		override protected function tearDown() : void {
			_collection = null;
		}


		public function testSize() : void {
			var dataCount : int = 12;
			for(var i : int = 0; i < dataCount; ++i) {
				_collection.add(i);
			}

			assertEquals("Testing size:", dataCount, _collection.size);
		}

		public function testContains() : void {
			assertTrue(_collection.add("a").contains("a"));
			assertFalse(_collection.add("b").contains("c"));
		}

		public function testAdd() : void {
			var dataCount : int = 5;
			for(var i : int = 0; i < dataCount; ++i) {
				assertEquals("Testing add via size:", i + 1, _collection.add(i).size);
			}
		}

		public function testRemove() : void {
			var i : int;
			var dataCount : int = 12;
			var removeCount : int = 8;
			for(i = 0; i < dataCount; ++i) {
				_collection.add(i);
			}

			for(i = 0; i < removeCount; ++i) {
				assertEquals("Testing remove via size:", dataCount - 1 - i, _collection.remove(i).size);
			}
		}

		public function testModify() : void {
			_collection.add("a");
			_collection.add("b");
			_collection.add("c");

			_collection.modify(new FunctionalCollectionModifier(function(data : *) : String {return String(data).toUpperCase();}));

			var str : String = "";
			var iterator : IIterator = _collection.iterator;
			while(iterator.hasNext()) {
				str += iterator.next;
			}

			assertEquals("Testing modify:", "ABC", str);
		}

		public function testFilter() : void {
			_collection.add("a");
			_collection.add("b");
			_collection.add("g");
			_collection.add("a");

			var filteredCollection : ICollection = _collection.filter(new FunctionalCollectionFilter(function(data : *) : Boolean {return data == "a";}));
			var str : String = "";
			var iterator : IIterator = filteredCollection.iterator;
			while(iterator.hasNext()) {
				str += iterator.next;
			}

			assertEquals("Testing filter:", "aa", str);
		}
	}
}
