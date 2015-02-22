<h1>Helicopter Supply Drop Epoch Mission Framework</h1>
<h3>Programmed for Arma 3 Epoch.</h3>

<strong>Current Version is v1.0a</strong><br />
(see https://github.com/tdavison70/Helicopter-Supply-Drop/releases for previous releases)

<h2>Features</h2>
<div style="padding: 4px; background: #efefef; border: 1px solid #666;">
<ul>
  <li>Random landing zones for supply crates delivered by AI pilots</li>
  <li>4 supply crate types are pre-defined: Food & Clothing / Supplies / Weapons & Ammo / Random Loot</li> 
  <li>Customizable crate loot (via editing init.sqf) also has random loot generator</li>
  <li>500-meter radius marker for LZ lets players know where to look</li>
  <li>Auto repeating mission once crate has been found</li>
  <li>Virtually no BE filters - uses mostly vanilla loot (but you might need to add a few)</li>
</ul>
</div>

<h2>Change History</h2>
<strong>v1.0b (current release)</strong>
<ul>
	<li>Added timer for helicopter to get to spawn (this should prevent issues with hovering heli's when a safe position 	cannot be found)</li>
	<li>Added timer for crate (it will de-spawn after one hour if no player gets with 10 meters of crate)
	Added chemLight next to crate to aid in its location at night</li>
	<li>Various performance issue fixes</li>
	<li>Changed how marker is spawned. It will now spawn after crate has landed - and will randomize the center from the 	crate (thus not making it obvious where crate is located). This fixed the crate drifting outside the LZ.</li>
	<li>Cleaned up parachute on landing; Cleaned up smoke grenade and chemLight after player gets within range.</li>
</ul>

<strong>v1.0a</strong>
<ul>
	<li>Added probability for supply drop to not happen (based on percentage you set: default 0)</li>
	<li>Added probability for supply helicopter to crash before it drops supplies (based on percentage you set: default 0)</li>
	<li>Added better message handling - notifications similar to SEM (using Hint with custom text)</li>
</ul>

<h2>Installation:</h2>
Extract it to your Desktop or somewhere where you won't lose it. Inside the Zip is this Readme.MD, and the folder "SupplyDrop-1.0". Inside you will find SDROP.pbo and the "SDrop" folder with mission and script files.

<strong>1. Edit your epoch.Altis initServer.sqf (or add one)</strong><br />
Paste in the following line (or add to existing IF SERVER condition):<br /><br />
if (isServer) then {<br />
	[] ExecVM "\SDROP\init.sqf";<br />
};

<strong>2. Edit your epoch.Altis init.sqf (or add one)</strong><br />
Paste in the following - this is used for sending messages to all players:<br /><br />
//Supply Drop Alert Event<br />
"SDROP_Alert" addPublicVariableEventHandler {<br />
	hint parseText format["%1", _this select 1];<br />
};

<strong>3. Copy the SDROP.pbo to your @EpochHive/addons/ 


<h2>Current Developers</h2>

tDavison - Developer - http://epochmod.com/forum/index.php?/user/29316-tdavison/

<h2>License</h2>

All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

http://creativecommons.org/licenses/by-nc-sa/4.0/
