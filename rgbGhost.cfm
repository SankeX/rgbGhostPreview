<!--- 
	Ghosting Mod Preview Tool
	Coded by Gary 'SankeX' Simmons 2013
	Web: http://sankex.tv
	Twitch: http://twitch.tv/sankeifx
	Email: code@sankex.tv
	Parameters:
		url.ar/ag/ab - Arrow R/G/B Values
		url.tr/rg/rb - Trail R/G/B Values
		ignoreForm - Set if url values detected
 --->
 <!--- Set up needed parameters --->
<cfparam name="url.ar" default="0"/>
<cfparam name="url.ag" default="0"/>
<cfparam name="url.ab" default="0"/>
<cfparam name="url.tr" default="0"/>
<cfparam name="url.tg" default="0"/>
<cfparam name="url.tb" default="0"/>
<cfparam name="ignoreForm" default="false"/>
<html>
<head>
	<title>Ghost Trail Preview Tool</title>
<head>
<body>
	<!--- Check if we need to ignore the form --->
	<cfif url.ar neq 0 or url.ag neq 0 or url.ab neq 0 or url.tr neq 0 or url.tg neq 0 or url.tb neq 0>
		<cfset form.arrowRed = url.ar/>
		<cfset form.arrowGreen = url.ag/>
		<cfset form.arrowBlue = url.ab/>
		<cfset form.trailRed = url.tr/>
		<cfset form.trailGreen = url.tg/>
		<cfset form.trailBlue = url.tb/>
		<cfset ignoreForm = true/>
	</cfif>
<cfif NOT ignoreForm>
	<!--- Display the form --->
	<form name="RGBSel" method="post">
		Arrow Red Val:
		<input name="arrowRed" type="text"/>
		Arrow Green Val:
		<input name="arrowGreen" type="text"/>
		Arrow Blue Val:
		<input name="arrowBlue" type="text"/>
		Trail Red Val:
		<input name="trailRed" type="text"/>
		Trail Green Val:
		<input name="trailGreen" type="text"/>
		Trail Blue Val:
		<input name="trailBlue" type="text"/>
		<input name="submit" type="submit" value="submit"/>
	</form>
</cfif>
<cfif IsDefined("form.submit") or ignoreForm>
	<!--- Round down to 255 if greater than 255 --->
	<cfif form.arrowRed gt 255 or NOT IsNumeric(form.arrowRed)>
		<cfset form.arrowRed = 255>
	</cfif>
	<cfif form.arrowGreen gt 255 or NOT IsNumeric(form.arrowGreen)>
		<cfset form.arrowGreen = 255>
	</cfif>
	<cfif form.arrowBlue gt 255 or NOT IsNumeric(form.arrowBlue)>
		<cfset form.arrowBlue = 255>
	</cfif>
	<cfif form.trailRed gt 255 or NOT IsNumeric(form.trailRed)>
		<cfset form.trailRed = 255>
	</cfif>
	<cfif form.trailGreen gt 255 or NOT IsNumeric(form.trailGreen)>
		<cfset form.trailGreen = 255>
	</cfif>
	<cfif form.trailBlue gt 255 or NOT IsNumeric(form.trailBlue)>
		<cfset form.trailBlue = 255>
	</cfif>
	<!--- Round up to 0 if negative --->
	<cfif form.arrowRed lt 0>
		<cfset form.arrowRed = 0>
	</cfif>
	<cfif form.arrowGreen lt 0>
		<cfset form.arrowGreen = 0>
	</cfif>
	<cfif form.arrowBlue lt 0>
		<cfset form.arrowBlue = 0>
	</cfif>
	<cfif form.trailRed lt 0>
		<cfset form.trailRed = 0>
	</cfif>
	<cfif form.trailGreen lt 0>
		<cfset form.trailGreen = 0>
	</cfif>
	<cfif form.trailBlue lt 0>
		<cfset form.trailBlue = 0>
	</cfif>
	Ghost Preview:
	<cfoutput>
		<div class="arrow" style="width:0;height:0;border-top:100px solid rgb(#form.arrowRed#,#form.arrowGreen#,#form.arrowBlue#);border-left:50px solid transparent;border-right:50px solid transparent;display:inline-block;"></div>
		<div class="trail" style="width:200px;height:4px;background-color:rgb(#form.trailRed#,#form.trailGreen#,#form.trailBlue#);display:inline-block;margin-left:-55px"></div></br>
		Values:</br>
		Arrow: #form.arrowRed#,#form.arrowGreen#,#form.arrowBlue#</br>
		Trail: #form.trailRed#,#form.trailGreen#,#form.trailBlue#</br>
		Sharing Link: 
		<a href="http://#cgi.HTTP_HOST##cgi.SCRIPT_NAME#?ar=#form.arrowRed#&ag=#form.arrowGreen#&ab=#form.arrowBlue#&tr=#form.trailRed#&tg=#form.trailGreen#&tb=#form.trailBlue#">
			http://#cgi.HTTP_HOST##cgi.SCRIPT_NAME#?ar=#form.arrowRed#&ag=#form.arrowGreen#&ab=#form.arrowBlue#&tr=#form.trailRed#&tg=#form.trailGreen#&tb=#form.trailBlue#</a>
	</cfoutput>
</cfif>