import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppTools {
  getClubByString(BuildContext context, String clubName) {
    final l = AppLocalizations.of(context)!;

    final Map<String, String> localizedStrings = {
      //premier league
      "premier_league_arsenal": l.premier_league_arsenal,
      "premier_league_aston_villa": l.premier_league_aston_villa,
      "premier_league_bournemouth": l.premier_league_bournemouth,
      "premier_league_brentford": l.premier_league_brentford,
      "premier_league_brighton": l.premier_league_brighton,
      "premier_league_chelsea": l.premier_league_chelsea,
      "premier_league_crystal_palace": l.premier_league_crystal_palace,
      "premier_league_everton": l.premier_league_everton,
      "premier_league_fulham": l.premier_league_fulham,
      "premier_league_ipswich_town": l.premier_league_ipswich_town,
      "premier_league_leicester_city": l.premier_league_leicester_city,
      "premier_league_liverpool": l.premier_league_liverpool,
      "premier_league_manchester_city": l.premier_league_manchester_city,
      "premier_league_manchester_united": l.premier_league_manchester_united,
      "premier_league_newcastle_united": l.premier_league_newcastle_united,
      "premier_league_nottm_forest": l.premier_league_nottm_forest,
      "premier_league_southampton": l.premier_league_southampton,
      "premier_league_tottenham_hotspur": l.premier_league_tottenham_hotspur,
      "premier_league_west_ham": l.premier_league_west_ham,
      "premier_league_wolverhampton": l.premier_league_wolverhampton,
      //la liga
      "la_liga_athletic_bilbao": l.la_liga_athletic_bilbao,
      "la_liga_atletico_madrid": l.la_liga_atletico_madrid,
      "la_liga_barcelona": l.la_liga_barcelona,
      "la_liga_celta_vigo": l.la_liga_celta_vigo,
      "la_liga_deportivo_alaves": l.la_liga_deportivo_alaves,
      "la_liga_espanyol": l.la_liga_espanyol,
      "la_liga_getafe": l.la_liga_getafe,
      "la_liga_girona": l.la_liga_girona,
      "la_liga_las_palmas": l.la_liga_las_palmas,
      "la_liga_leganes": l.la_liga_leganes,
      "la_liga_mallorca": l.la_liga_mallorca,
      "la_liga_osasuna": l.la_liga_osasuna,
      "la_liga_rayo_vallecano": l.la_liga_rayo_vallecano,
      "la_liga_real_betis": l.la_liga_real_betis,
      "la_liga_real_madrid": l.la_liga_real_madrid,
      "la_liga_real_sociedad": l.la_liga_real_sociedad,
      "la_liga_real_valladolid": l.la_liga_real_valladolid,
      "la_liga_sevilla": l.la_liga_sevilla,
      "la_liga_valencia": l.la_liga_valencia,
      "la_liga_villarreal": l.la_liga_villarreal,
    };

    return localizedStrings[clubName] ?? clubName;
  }
}
