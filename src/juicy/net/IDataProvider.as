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
	 * <code>IDataProvider</code>s load external data and notify registered
	 * <code>IDataClient</code>s as soon as the data has been loaded or could
	 * not be loaded because of some kind of error.
	 * 
	 * @author Johannes Hodde
	 */
	public interface IDataProvider {

		/**
		 * Adds the specified <code>IDataClient</code>.
		 * 
		 * @param dataClient the <code>IDataClient</code> to add.
		 */
		function addDataClient(dataClient : IDataClient) : void;

		/**
		 * Removes the specified <code>IDataClient</code>.
		 * 
		 * @param dataClient the <code>IDataClient</code> to remove.
		 */
		function removeDataClient(dataClient : IDataClient) : void;
	}
}
