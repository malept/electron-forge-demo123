ICONS = clear.ico storm.ico icon.ico

clear.ico: 16/weather-clear-symbolic.symbolic.png 32/weather-clear-symbolic.symbolic.png 48/weather-clear-symbolic.symbolic.png 64/weather-clear-symbolic.symbolic.png 96/weather-clear-symbolic.symbolic.png
	icotool --create --output=$@ $^

storm.ico: 16/weather-storm-symbolic.symbolic.png 32/weather-storm-symbolic.symbolic.png 48/weather-storm-symbolic.symbolic.png 64/weather-storm-symbolic.symbolic.png 96/weather-storm-symbolic.symbolic.png
	icotool --create --output=$@ $^

icon.ico: 16/weather-windy-symbolic.symbolic.png 32/weather-windy-symbolic.symbolic.png 48/weather-windy-symbolic.symbolic.png 64/weather-windy-symbolic.symbolic.png 96/weather-windy-symbolic.symbolic.png
	icotool --create --output=$@ $^

all: $(ICONS)

clean:
	rm -f $(ICONS)
