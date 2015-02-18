<h1>Helicopter Supply Drop Epoch Mission Framework</h1>
<h3>Programmed for Arma 3 Epoch.</h3>

Current Version is v1.0

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

<h2>Installation:</h2>
Extract it to your Desktop or somewhere where you won't lose it. Inside the Zip is this Readme.MD, and the folder "SupplyDrop-1.0". Inside you will find SDROP.pbo and the "SDrop" folder with mission and script files.

<strong>1. Edit your epoch.Altis initServer.sqf (or add one)</strong><br />
Paste in the following line (or add to existing IF SERVER condition):<br />
if (isServer) then {
	[] ExecVM "\SDROP\init.sqf";
};

<strong>2. Edit your epoch.Altis init.sqf (or add one)</strong><br />
Paste in the following - this is used for sending messages to all players:<br />
//Supply Drop Alert Event
"SDROP_Alert" addPublicVariableEventHandler {
	titleText[format["%1",_this select 1],"PLAIN DOWN",1];
};

<strong>3. Copy the SDROP.pbo to your @EpochHive/addons/ 


<h2>Current Developers</h2>

tDavison - Developer - http://epochmod.com/forum/index.php?/user/29316-tdavison/

<h2>License</h2>

All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

http://creativecommons.org/licenses/by-nc-sa/4.0/
