# frozen_string_literal: true

module AnkiRecord
  ##
  # This is the SQL insert statement (as a Ruby string/here document) for the
  # default col record in the collection.anki2 exported from a new Anki 2.1.54 profile
  CLEAN_COLLECTION_2_RECORD = <<~SQL
    INSERT INTO col VALUES(1,1676883600,1676902390012,1676902390005,11,0,0,0,'{"addToCur":true,"_deck_1_lastNotetype":1676902390008,"nextPos":2,"sortType":"noteFld","newSpread":0,"schedVer":2,"collapseTime":1200,"estTimes":true,"curDeck":1,"creationOffset":300,"dayLearnFirst":false,"timeLim":0,"activeDecks":[1],"sortBackwards":false,"_nt_1676902390008_lastDeck":1,"curModel":1676902390008,"dueCounts":true}','{"1676902390010":{"id":1676902390010,"name":"Basic (optional reversed card)","type":0,"mod":0,"usn":0,"sortf":0,"did":null,"tmpls":[{"name":"Card 1","ord":0,"qfmt":"{{Front}}","afmt":"{{FrontSide}}\\n\\n<hr id=answer>\\n\\n{{Back}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0},{"name":"Card 2","ord":1,"qfmt":"{{#Add Reverse}}{{Back}}{{/Add Reverse}}","afmt":"{{FrontSide}}\\n\\n<hr id=answer>\\n\\n{{Front}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0}],"flds":[{"name":"Front","ord":0,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Back","ord":1,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Add Reverse","ord":2,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""}],"css":".card {\\n    font-family: arial;\\n    font-size: 20px;\\n    text-align: center;\\n    color: black;\\n    background-color: white;\\n}\\n","latexPre":"\\\\documentclass[12pt]{article}\\n\\\\special{papersize=3in,5in}\\n\\\\usepackage[utf8]{inputenc}\\n\\\\usepackage{amssymb,amsmath}\\n\\\\pagestyle{empty}\\n\\\\setlength{\\\\parindent}{0in}\\n\\\\begin{document}\\n","latexPost":"\\\\end{document}","latexsvg":false,"req":[[0,"any",[0]],[1,"all",[1,2]]]},"1676902390009":{"id":1676902390009,"name":"Basic (and reversed card)","type":0,"mod":0,"usn":0,"sortf":0,"did":null,"tmpls":[{"name":"Card 1","ord":0,"qfmt":"{{Front}}","afmt":"{{FrontSide}}\\n\\n<hr id=answer>\\n\\n{{Back}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0},{"name":"Card 2","ord":1,"qfmt":"{{Back}}","afmt":"{{FrontSide}}\\n\\n<hr id=answer>\\n\\n{{Front}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0}],"flds":[{"name":"Front","ord":0,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Back","ord":1,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""}],"css":".card {\\n    font-family: arial;\\n    font-size: 20px;\\n    text-align: center;\\n    color: black;\\n    background-color: white;\\n}\\n","latexPre":"\\\\documentclass[12pt]{article}\\n\\\\special{papersize=3in,5in}\\n\\\\usepackage[utf8]{inputenc}\\n\\\\usepackage{amssymb,amsmath}\\n\\\\pagestyle{empty}\\n\\\\setlength{\\\\parindent}{0in}\\n\\\\begin{document}\\n","latexPost":"\\\\end{document}","latexsvg":false,"req":[[0,"any",[0]],[1,"any",[1]]]},"1676902390008":{"id":1676902390008,"name":"Basic","type":0,"mod":0,"usn":0,"sortf":0,"did":null,"tmpls":[{"name":"Card 1","ord":0,"qfmt":"{{Front}}","afmt":"{{FrontSide}}\\n\\n<hr id=answer>\\n\\n{{Back}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0}],"flds":[{"name":"Front","ord":0,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Back","ord":1,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""}],"css":".card {\\n    font-family: arial;\\n    font-size: 20px;\\n    text-align: center;\\n    color: black;\\n    background-color: white;\\n}\\n","latexPre":"\\\\documentclass[12pt]{article}\\n\\\\special{papersize=3in,5in}\\n\\\\usepackage[utf8]{inputenc}\\n\\\\usepackage{amssymb,amsmath}\\n\\\\pagestyle{empty}\\n\\\\setlength{\\\\parindent}{0in}\\n\\\\begin{document}\\n","latexPost":"\\\\end{document}","latexsvg":false,"req":[[0,"any",[0]]]},"1676902390011":{"id":1676902390011,"name":"Basic (type in the answer)","type":0,"mod":0,"usn":0,"sortf":0,"did":null,"tmpls":[{"name":"Card 1","ord":0,"qfmt":"{{Front}}\\n\\n{{type:Back}}","afmt":"{{Front}}\\n\\n<hr id=answer>\\n\\n{{type:Back}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0}],"flds":[{"name":"Front","ord":0,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Back","ord":1,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""}],"css":".card {\\n    font-family: arial;\\n    font-size: 20px;\\n    text-align: center;\\n    color: black;\\n    background-color: white;\\n}\\n","latexPre":"\\\\documentclass[12pt]{article}\\n\\\\special{papersize=3in,5in}\\n\\\\usepackage[utf8]{inputenc}\\n\\\\usepackage{amssymb,amsmath}\\n\\\\pagestyle{empty}\\n\\\\setlength{\\\\parindent}{0in}\\n\\\\begin{document}\\n","latexPost":"\\\\end{document}","latexsvg":false,"req":[[0,"any",[0,1]]]},"1676902390012":{"id":1676902390012,"name":"Cloze","type":1,"mod":0,"usn":0,"sortf":0,"did":null,"tmpls":[{"name":"Cloze","ord":0,"qfmt":"{{cloze:Text}}","afmt":"{{cloze:Text}}<br>\\n{{Back Extra}}","bqfmt":"","bafmt":"","did":null,"bfont":"","bsize":0}],"flds":[{"name":"Text","ord":0,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""},{"name":"Back Extra","ord":1,"sticky":false,"rtl":false,"font":"Arial","size":20,"description":""}],"css":".card {\\n    font-family: arial;\\n    font-size: 20px;\\n    text-align: center;\\n    color: black;\\n    background-color: white;\\n}\\n.cloze {\\n    font-weight: bold;\\n    color: blue;\\n}\\n.nightMode .cloze {\\n    color: lightblue;\\n}\\n","latexPre":"\\\\documentclass[12pt]{article}\\n\\\\special{papersize=3in,5in}\\n\\\\usepackage[utf8]{inputenc}\\n\\\\usepackage{amssymb,amsmath}\\n\\\\pagestyle{empty}\\n\\\\setlength{\\\\parindent}{0in}\\n\\\\begin{document}\\n","latexPost":"\\\\end{document}","latexsvg":false,"req":[[0,"any",[0]]]}}','{"1":{"id":1,"mod":0,"name":"Default","usn":0,"lrnToday":[0,0],"revToday":[0,0],"newToday":[0,0],"timeToday":[0,0],"collapsed":true,"browserCollapsed":true,"desc":"","dyn":0,"conf":1,"extendNew":0,"extendRev":0}}','{"1":{"id":1,"mod":0,"name":"Default","usn":0,"maxTaken":60,"autoplay":true,"timer":0,"replayq":true,"new":{"bury":false,"delays":[1.0,10.0],"initialFactor":2500,"ints":[1,4,0],"order":1,"perDay":20},"rev":{"bury":false,"ease4":1.3,"ivlFct":1.0,"maxIvl":36500,"perDay":200,"hardFactor":1.2},"lapse":{"delays":[10.0],"leechAction":1,"leechFails":8,"minInt":1,"mult":0.0},"dyn":false,"newMix":0,"newPerDayMinimum":0,"interdayLearningMix":0,"reviewOrder":0,"newSortOrder":0,"newGatherPriority":0,"buryInterdayLearning":false}}','{}');
  SQL
end
