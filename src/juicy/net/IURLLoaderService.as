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
	import flash.net.URLRequest;
	import juicy.net.IDataProvider;
	
	/**
	 * The <code>IURLLoaderService</code> is an <code>IDataProvider</code>
	 * allowing for loading external data like JSON, XML, etc.
	 * via an <code>URLRequest</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public interface IURLLoaderService extends IDataProvider {

		/**
		 * Loads external data using the specified <code>URLRequest</code>.
		 * 
		 * @param urlRequest the <code>URLRequest</code> to use.
		 */
		function load(urlRequest : URLRequest) : void;
	}
}
