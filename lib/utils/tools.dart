import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppTools {
  getClubByString(BuildContext context, String clubName) {
    final l = AppLocalizations.of(context)!;

    final Map<String, String> localizedStrings = {
      //premier league
      "arsenal": l.arsenal,
      "aston_villa": l.aston_villa,
      "bournemouth": l.bournemouth,
      "brentford": l.brentford,
      "brighton": l.brighton,
      "chelsea": l.chelsea,
      "crystal_palace": l.crystal_palace,
      "everton": l.everton,
      "fulham": l.fulham,
      "ipswich_town": l.ipswich_town,
      "leicester_city": l.leicester_city,
      "liverpool": l.liverpool,
      "manchester_city": l.manchester_city,
      "manchester_united": l.manchester_united,
      "newcastle_united": l.newcastle_united,
      "nottm_forest": l.nottm_forest,
      "southampton": l.southampton,
      "tottenham_hotspur": l.tottenham_hotspur,
      "west_ham": l.west_ham,
      "wolverhampton": l.wolverhampton,
      //la liga
      "athletic_bilbao": l.athletic_bilbao,
      "atletico_madrid": l.atletico_madrid,
      "barcelona": l.barcelona,
      "celta_vigo": l.celta_vigo,
      "deportivo_alaves": l.deportivo_alaves,
      "espanyol": l.espanyol,
      "getafe": l.getafe,
      "girona": l.girona,
      "las_palmas": l.las_palmas,
      "leganes": l.leganes,
      "mallorca": l.mallorca,
      "osasuna": l.osasuna,
      "rayo_vallecano": l.rayo_vallecano,
      "real_betis": l.real_betis,
      "real_madrid": l.real_madrid,
      "real_sociedad": l.real_sociedad,
      "real_valladolid": l.real_valladolid,
      "sevilla": l.sevilla,
      "valencia": l.valencia,
      "villarreal": l.villarreal,
      //Serie A
      "napoli": l.napoli,
      "inter_milan": l.inter_milan,
      "atalanta": l.atalanta,
      "juventus": l.juventus,
      "lazio": l.lazio,
      "roma": l.roma,
      "bologna": l.bologna,
      "ac_milan": l.ac_milan,
      "fiorentina": l.fiorentina,
      "como": l.como,
      "torino": l.torino,
      "udinese": l.udinese,
      "genoa": l.genoa,
      "cagliari": l.cagliari,
      "verona": l.verona,
      "parma": l.parma,
      "venezia": l.venezia,
      "lecce": l.lecce,
      "empoli": l.empoli,
      "monza": l.monza,
    };

    return localizedStrings[clubName] ?? clubName;
  }
}
