function json_read(key){

var language = global.lang;

// Open the Json file
var JsonFile = file_text_open_read(working_directory + "/language/langs.json");
var Data = "";

// Read through the Json file and save the text in the Data variable
while (!file_text_eof(JsonFile)) {
    Data += file_text_read_string(JsonFile);
    file_text_readln(JsonFile);
}

// Close the Json file
file_text_close(JsonFile);

// Store the data in a temporary map
var temp_map = json_decode(Data);

// Find the current game language data
var lang_map = ds_map_find_value(temp_map, language);

// If the keyword you typed in as argument is not a string, convert it to a string, just in case you don't get any errors
if (!is_string(key)) key = string(key);

// Store the output string in a local variable before destroying the data structures
var output_string = lang_map[? key];

// Destroy the maps you've created to prevent memory leaks
ds_map_destroy(temp_map);
ds_map_destroy(lang_map);

// Return the output string
return output_string;
}