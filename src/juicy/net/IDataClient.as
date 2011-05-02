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

	/**
	 * <code>IDataClient</code>s are added/removed to/from
	 * <code>IDataProvider</code>s in order to get notified whenever
	 * data has been loaded or couldn't be loaded.
	 * 
	 * @author Johannes Hodde
	 */
	public interface IDataClient {

		/**
		 * Is called by <code>IDataProvider</code>s if the data has been
		 * loaded.
		 * 
		 * @param dataProvider the <code>IDataProvider</code> that's data
		 * has been loaded.
		 * @param data the data that has been loaded.
		 */
		function result(dataProvider : IDataProvider, data : *) : void;

		/**
		 * Is called by <code>IDataProvider</code>s if the data could
		 * not be loaded.
		 * 
		 * @param dataProvider the <code>IDataProvider</code> that's data
		 * could not be loaded.
		 * @param error an <code>Error</code> containing information about
		 * the error.
		 */
		function fail(dataProvider : IDataProvider, error : Error) : void;

		/**
		 * Is called by <code>IDataProvider</Code>s if the loading progress
		 * has changed.
		 * 
		 * @param dataProvider the <code>IDataProvider</code> that's loading
		 * progress has changed.
		 * @param progress the loading progress from 0 to 1.
		 */
		function progress(dataProvider : IDataProvider, progress : Number) : void;
	}
}
