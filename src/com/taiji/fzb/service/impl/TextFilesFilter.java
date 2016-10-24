package com.taiji.fzb.service.impl;
import java.io.File;
import java.io.FileFilter;

 public class TextFilesFilter implements FileFilter {
		public boolean accept (File path) {
			return path.getName().toLowerCase().endsWith(".doc");
		}
	}