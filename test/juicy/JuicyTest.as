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
	import asunit.textui.TestRunner;

	import flash.display.Sprite;

	/**
	 * @author Johannes Hodde
	 */
	public class JuicyTest extends Sprite {

		public function JuicyTest() {
			var juicyTestRunner : TestRunner = new TestRunner();
			addChild(juicyTestRunner);
			juicyTestRunner.start(JuicyTestSuite, null, TestRunner.SHOW_TRACE);
		}
	}
}
