#!/bin/bash
while read verb; do
	space="          "
	space="${space:0:10-${#verb}*2}"
	mas="${verb: -2}"
	if [ ! "$mas" == "ます" ] ; then
		echo "$verb isn't in \"mas\" form!"
		continue
	fi
	body="${verb:0:${#verb}-2}"
	lc="${body: -1}"
	head="${body:0:${#body}-1}"
	if [[ $lc = "り" ]] || [[ $lc = "い" ]] || [[ $lc = "ち" ]] ; then
		suf="って"
	else
		if [[ $lc = "み" ]] || [[ $lc = "に" ]] || [[ $lc = "び" ]] ; then
			suf="んで"
		else
			suf=""
			if [[ "$lc" = "き" ]] ; then
				suf="い"
			fi
			suf="$suf""て"
			head="$body"
        	fi
	fi
	printf "$space$verb => $head$suf\n"
done <verbs.txt
