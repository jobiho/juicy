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
	import juicy.collections.iterator.ListIterator;

	/**
	 * @author Johannes Hodde
	 */
	public class AbstractListTestCase extends AbstractCollectionTestCase {

		protected var _list : IList;

		public function AbstractListTestCase(list : IList, testMethod : String = null) {
			super(list, testMethod);

			_list = list;
		}

		override protected function tearDown() : void {
			super.tearDown();

			_list = null;
		}

		override public function testRemove() : void {
			super.testRemove();

			assertThrows(ArgumentError, _list.remove);
		}

		public function testAddBefore() : void {
			_list.add("a");
			_list.add("b");
			_list.add("c");

			assertEquals("Testing addBefore via size:", 4, _list.addBefore("d", 0).size);
			assertEquals("Testing addBefore via getAt:", "e", _list.addBefore("e", 3).getAt(3));
			assertEquals("Testing addBefore via getAt:", "f", _list.addBefore("f", 2).getAt(2));

			assertThrows(ArgumentError, _list.addBefore);
		}

		public function testAddAfter() : void {
			_list.add("a");
			_list.add("b");
			_list.add("c");

			assertEquals("Testing addAfter via size:", 4, _list.addAfter("d", 0).size);
			assertEquals("Testing addAfter via getAt:", "e", _list.addAfter("e", 3).getAt(4));
			assertEquals("Testing addAfter via getAt:", "f", _list.addAfter("f", 2).getAt(3));

			assertThrows(ArgumentError, _list.addBefore);
		}

		public function testRemoveAt() : void {
			_list.add("a");
			_list.add("b");
			_list.add("c");
			_list.add("d");

			assertEquals("Testing removeAt via size:", 3, _list.removeAt(0).size);
			assertEquals("Testing removeAt via getAt:", "c", _list.removeAt(2).getAt(1));
			assertEquals("Testing removeAt via getAt:", "b", _list.removeAt(1).getAt(0));

			assertThrows(ArgumentError, _list.addBefore);
		}

		public function testGetAt() : void {
			assertEquals("Testing getAt:", "a", IList(_list.add("a")).getAt(0));
			assertEquals("Testing getAt:", "b", IList(_list.add("b")).getAt(1));
			assertEquals("Testing getAt:", "c", IList(_list.add("c")).getAt(2));

			assertThrows(ArgumentError, _list.getAt);
		}

		public function testGetAtOrElse() : void {
			_list.add("a");
			_list.add("b");
			assertEquals("Testing getAtOrElse:", "someDefaultValue", _list.getAtOrElse(3, "someDefaultValue"));
			assertEquals("Testing getAtOrElse:", "b", _list.getAtOrElse(1));
		}

		public function testIterator() : void {
			assertTrue(_list.iterator is ListIterator);
		}
	}
}
