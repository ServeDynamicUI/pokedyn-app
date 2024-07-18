INSERT INTO public.widget ("widgetId","widgetType","widgetData","widgetName") VALUES
	 (2,'dy_carousel','"{\"type\":\"dy_carousel\",\"data\":{\"key\":\"{KEY_1}\",\"reusable\":true,\"carouselOptions\":{\"autoPlay\":true,\"enlargeCenterPage\":true,\"scrollDirection\":\"horizontal\",\"reverse\":false,\"enableInfiniteScroll\":false,\"viewportFraction\":1,\"height\":300},\"children\":[]}}"','pokemon_carousel'),
	 (3,'dy_card','"{\"type\":\"dy_card\",\"data\":{\"key\":\"{KEY_1}\",\"margin\":\"10\",\"padding\":\"10\",\"elevation\":10,\"linearGradient\":\"{LINEAR_GRADIENT_AS_PER_TYPE}\",\"borderRadius\":20,\"child\":{\"type\":\"dy_image\",\"data\":{\"key\":\"{KEY_2}\",\"src\":\"{POKEMON_OFFICIAL_ARTWORK_PNG_URL}\",\"width\":450,\"imageType\":\"network\",\"fit\":\"fill\",\"placeholderImagePath\":\"assets/images/ic_pokemon_placeholder.png\"}}}}"','pokemon_carousel_card'),
	 (4,'dy_container','"{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_1}\",\"margin\":\"0,20\",\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_2}\",\"text\":\"{POKEMON_NAME}\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":35}}}}}"','pokemon_detail_pokemon_name'),
	 (6,'dy_container','"{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_1}\",\"margin\":\"0,20,0,0\",\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_2}\",\"text\":\"Base Stats\",\"style\":{\"color\":\"0xff8c8d8d\",\"fontWeight\":\"bold\",\"fontSize\":20}}}}}"','pokemon_detail_base_stats_text'),
	 (7,'dy_column','"{\"type\":\"dy_column\",\"data\":{\"key\":\"{KEY_1}\",\"interItemSpacing\":20,\"children\":[]}}"','pokemon_detail_stats_column'),
	 (8,'dy_percent_indicator','"{\"type\":\"dy_percentage_indicator\",\"data\":{\"key\":\"{KEY_1}\",\"type\":\"linear\",\"linearPercentIndicator\":{\"percent\":\"{PERCENT_VALUE_IN_DOUBLE}\",\"lineHeight\":18,\"linearGradient\":\"{GRADIENT_AS_PER_STAT}\",\"animation\":true,\"animationDuration\":1000,\"barRadius\":10,\"backgroundColor\":\"0xffffffff\",\"center\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_2}\",\"text\":\"{PERCENT_VALUE_TEXT}\",\"style\":{\"fontSize\":15,\"fontWeight\":\"bold\",\"color\":\"0xff000000\"}}},\"leading\":{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_3}\",\"width\":40,\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_4}\",\"text\":\"{STAT_NAME}\",\"style\":{\"fontSize\":15,\"fontWeight\":\"bold\",\"color\":\"0xffffffff\"}}}}}}}}"','pokemon_detail_stat_percent_indicator'),
	 (1,'dy_gesture_detector','"{\"type\":\"dy_gesture_detector\",\"data\":{\"key\":\"{KEY_1}\",\"onTapAction\":{\"actionString\":\"\/moveToScreen\",\"extras\":{\"url\":\"{BACKEND_POKEMON_DETAIL_URL}\",\"urlType\":\"network\",\"navigationType\":\"screen\",\"navigationStyle\":\"push\",\"loaderWidgetAssetPath\":\"assets\/json\/shimmers\/pokedyn_detail_page_shimmer.json\"}},\"child\":{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_2}\",\"containerGradient\":\"-1.0,0.0;1.0,0.0;0xff42A5F5,0xffAB47BC\",\"height\":350,\"showBorder\":true,\"borderColor\":\"0xffffffff\",\"borderRadius\":15,\"child\":{\"type\":\"dy_column\",\"data\":{\"key\":\"{KEY_3}\",\"children\":[{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_4}\",\"child\":{\"type\":\"dy_image\",\"data\":{\"key\":\"{KEY_5}\",\"src\":\"{POKEMON_IMAGE}\",\"width\":250,\"height\":200,\"imageType\":\"network\",\"fit\":\"fill\",\"placeholderImagePath\":\"assets\/images\/ic_pokemon_placeholder.png\"}}}},{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_6}\",\"text\":\"{POKEMON_NAME}\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":20}}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_7}\",\"height\":30}},{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_8}\",\"backgroundColor\":\"{POKEMON_TYPE_BG_COLOR_AS_PER_TYPE}\",\"borderRadius\":20,\"width\":250,\"padding\":\"10\",\"showBorder\":true,\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_9}\",\"text\":\"Type: {POKEMON_MAIN_TYPE}\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":20}}}}}]}}}}}}"','pokedyn_homepage_pokemon_card'),
	 (5,'dy_row','"{\"type\":\"dy_row\",\"data\":{\"key\":\"{KEY_1}\",\"mainAxisAlignment\":\"center\",\"children\":[{\"type\":\"dy_column\",\"data\":{\"key\":\"{KEY_2}\",\"children\":[{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_3}\",\"backgroundColor\":\"{POKEMON_TYPE1_COLOR}\",\"borderRadius\":20,\"width\":150,\"padding\":\"10\",\"showBorder\":true,\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_4}\",\"text\":\"{POKEMON_TYPE1}\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":15}}}}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_5}\",\"height\":25}},{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_6}\",\"text\":\"{POKEMON_WEIGHT} KG\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":18}}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_7}\",\"height\":10}},{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_8}\",\"text\":\"Weight\",\"style\":{\"color\":\"0xff555254\",\"fontWeight\":\"bold\",\"fontSize\":15}}}]}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_9}\",\"width\":20}},{\"type\":\"dy_column\",\"data\":{\"key\":\"{KEY_10}\",\"children\":[{\"type\":\"dy_container\",\"data\":{\"key\":\"{KEY_11}\",\"backgroundColor\":\"{POKEMON_TYPE2_COLOR}\",\"borderRadius\":20,\"width\":150,\"padding\":\"10\",\"showBorder\":true,\"child\":{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_12}\",\"text\":\"{POKEMON_TYPE2}\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":15}}}}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_13}\",\"height\":25}},{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_14}\",\"text\":\"{POKEMON_HEIGHT} M\",\"style\":{\"color\":\"0xffffffff\",\"fontWeight\":\"bold\",\"fontSize\":18}}},{\"type\":\"dy_sized_box\",\"data\":{\"key\":\"{KEY_15}\",\"height\":10}},{\"type\":\"dy_text\",\"data\":{\"key\":\"{KEY_16}\",\"text\":\"Height\",\"style\":{\"color\":\"0xff555254\",\"fontWeight\":\"bold\",\"fontSize\":15}}}]}}]}}"','pokemon_detail_pokemon_type_row');