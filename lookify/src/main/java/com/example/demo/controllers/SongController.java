package com.example.demo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.models.Song;
import com.example.demo.services.SongService;

@Controller
public class SongController {
	@Autowired 
	SongService songService;
	
	@GetMapping("")
	public String welcome() {
		return "index.jsp";
	}
	
	@GetMapping("/view/{id}")
	public String viewSong(Model model,@PathVariable("id") Long id) {
		Song song = songService.findSong(id);
		model.addAttribute("song",song);
		return "view.jsp";
	}
	
	@GetMapping("/songs")
	public String allLang(Model model, @ModelAttribute("song") Song song) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs",songs);
		return "dashboard.jsp";
	}
	@GetMapping("/songs/create")
    public String newSong(@ModelAttribute("song") Song song) {
        return "create.jsp";
    }
	
	@PostMapping("/songs/create")
	public String create(Model model,@Valid @ModelAttribute("song") Song song,BindingResult result) {
		if (result.hasErrors()) {
			List<Song> songs = songService.allSongs();
			model.addAttribute("songs",songs);
			return "create.jsp";
		}else {
			songService.createSong(song);
			return "redirect:/songs";
		}
		
	}

    @RequestMapping(value="/song/del/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
    	songService.deleteSong(id);
        return "redirect:/songs";
    }
	
    @PostMapping("/search")
	public String search(@PathVariable("artist") String artist) {
		return "redirect:/search/"+artist;
    }
    
    @GetMapping("/search/{artist}")
	public String showSearch(Model model,@PathVariable("artist")String artist) {
		List<Song> songs = songService.findbyArtist(artist);
		model.addAttribute("songs",songs);
		model.addAttribute("artist",artist);
		
		return "search.jsp";
	}
    
    @GetMapping("/topTen")
	public String topTenSong(Model model) {
		List<Song> topSongs=songService.TopTen();
		model.addAttribute("songs", topSongs);
		
		return "top.jsp";
	}
}	
	

