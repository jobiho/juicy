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
	import flash.system.LoaderContext;
	import flash.net.URLRequest;
	import juicy.net.IDataProvider;
	
	/**
	 * The <code>ILoaderService</code> is an <code>IDataProvider</code>
	 * allowing for loading external data like swfs and images via an
	 * <code>URLRequest</code> and an optional <code>LoaderContext</code>.
	 * 
	 * @author Johannes Hodde
	 */
	public interface ILoaderService extends IDataProvider {

		/**
		 * Loads external data using the specified <code>URLRequest</code>
		 * and an optional <code>LoaderContext</code>.
		 * 
		 * @param urlRequest the <code>URLRequest</code> to use.
		 * @param loaderContext an optional <code>LoaderContext</code>.
		 */
		function load(urlRequest : URLRequest, loaderContext : LoaderContext = null) : void;
	}
}
