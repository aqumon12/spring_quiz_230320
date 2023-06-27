package com.quiz.weather.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.weather.domain.WeatherHistory;

@Repository
public interface WeatherHistoryMapper {
	
	public List<WeatherHistory> sellectWeatherHistory();
	
	public void insertWeatherHistory(
			@Param("date") Date date,
			@Param("weather") String weather,
			@Param("microDust") String microDust,
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation,
			@Param("windSpeed") double windSpeed);
}
