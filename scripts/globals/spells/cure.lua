-----------------------------------------
-- Spell: Cure
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

	MND = caster:getStat(MOD_MND);
	VIT = target:getStat(MOD_VIT);
	HealingMagic = caster:getSkillLevel(0x0021);
	minimum = 10;
	Power = 3 * MND + VIT + 3* math.floor((HealingMagic /5));
	if (Power < 60) then
		divisor = 1;
		constant = -10;
	elseif (Power < 100) then
		divisor = 2;
		constant = 5;
	else
	divisor = 57;
	constant = 29.125;
	end	
--ToDo: Implement day & weather bonuses
	basecure = math.floor(Power/2)/divisor + constant;
	Final = math.floor(basecure);
	if(Final < minimum) then Final = minimum; end
	return target:addHP(Final);
end;