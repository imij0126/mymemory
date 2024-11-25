package com.kh.mini.playlist.controller;

import java.util.ArrayList;

import com.kh.mini.playlist.Music;

public class PlayController {
	
	private ArrayList<Music> playlist = new ArrayList();
	
	public PlayController() {}
	
	public void insertMusic(Music m) {
		playlist.add(m);
	}
	
	public ArrayList<Music> selectList() {
		return playlist;
	}
	
	public ArrayList<Music> searchMusic(String keyword) {
		ArrayList<Music> searchList = new ArrayList<>();
		
		for(int i=0; i<playlist.size(); i++) {
			Music m = playlist.get(i);
			String title = m.getTitle();
			if(playlist.contains(keyword)) {
				searchList.add(m);
			}
		}
		return searchList;
}
	
	public Music deleteMusic(String title, String artist) {
		
	}
	
	public int ascMusic() {
		
	}
	
	public void fileSave(String file, Stringbuilder sb) {
		
	}
	
	public void fileOpen(String file, Stringbuilder sb) {
		
	}
	
	public void fileEdit(String file, Stringbuilder sb) {
		
	}
	

}
