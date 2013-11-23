package com.radius.base.view;

import java.util.Locale;
import java.util.Map;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

public class MultiViewResover implements ViewResolver{

	private Map<String, ViewResolver> resolvers;
	
	
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		
		 int n=viewName.indexOf("_");
		 if(n==-1) return null;
		 String suffix=viewName.substring(n+1);
		 ViewResolver resolver = resolvers.get(suffix);   
		 viewName = viewName.substring(0,n);

		 if(resolver!=null)   
	            return resolver.resolveViewName(viewName, locale);   
		 throw new RuntimeException("NoSuchViewResolver for " + suffix);

	}


	public Map<String, ViewResolver> getResolvers() {
		return resolvers;
	}


	public void setResolvers(Map<String, ViewResolver> resolvers) {
		this.resolvers = resolvers;
	}

}
