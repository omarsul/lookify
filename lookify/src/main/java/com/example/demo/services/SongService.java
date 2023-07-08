package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.Song;
import com.example.demo.repositories.SongRepo;

@Service
public class SongService {
	
	private final SongRepo songRepo;
	
	public SongService(SongRepo songRepo) {
		this.songRepo = songRepo;
	}
	
	public List<Song> allSongs(){
		return songRepo.findAll();
	}
	
	public Song createSong(Song a) {
		return songRepo.save(a);
	}
	
	public Song findSong(Long id) {
		Optional<Song> optionalLanguage = songRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		}else {
			return null;
		}
		
	}
	
	public void deleteSong(Long id) {
		Optional<Song> optionalLanguage = songRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			songRepo.deleteById(id);
		}
	}

	public List<Song> findbyArtist(String artist) {
		// TODO Auto-generated method stub
		return songRepo.findByArtist(artist);
	}

	public List<Song> TopTen() {
		// TODO Auto-generated method stub
		return songRepo.findTop10ByOrderByRatingDesc();
	}
}
