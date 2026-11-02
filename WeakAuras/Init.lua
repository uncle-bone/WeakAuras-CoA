local AddonName = ...
local Private = select(2, ...)
WeakAuras = {}
WeakAuras.L = {}
Private.frames = {}

WeakAuras.normalWidth = 1.3
WeakAuras.halfWidth = WeakAuras.normalWidth / 2
WeakAuras.doubleWidth = WeakAuras.normalWidth * 2

local versionStringFromToc = GetAddOnMetadata("WeakAuras", "Version")
local versionString = "1.0.5"
-- Year, Month, Day, Hour, Minute, Seconds
local buildTime = "2025".."11".."29".."04".."45".."00"
local isTTSEnabled = C_VoiceChat and C_VoiceChat.SpeakText and true or false
local isDBMRegistered = (DBM and type(DBM.Revision) == "number" and DBM.Revision >= 20250929200404) and true or false

local flavor
if GetRealmName() == "Kezan" or GetRealmName() == "Menethil" or GetRealmName() == "Gurubashi" then
  flavor = "ClassicPlus"
else
  flavor = "Wrath"
end

WeakAuras.versionString = versionString
WeakAuras.buildTime = buildTime
WeakAuras.newFeatureString = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0|t"
WeakAuras.BuildInfo = select(4, GetBuildInfo())

function WeakAuras.IsTTSEnabled()
  return isTTSEnabled
end

function WeakAuras.IsDBMRegistered()
  return isDBMRegistered
end

function WeakAuras.IsCorrectVersion()
  return true
end

function WeakAuras.IsWrath()
  return flavor == "Wrath"
end

function WeakAuras.IsClassicPlus()
  return flavor == "ClassicPlus"
end

WeakAuras.prettyPrint = function(...)
  print("|cff9900ffWeakAuras:|r ", ...)
end

-- Force enable WeakAurasCompanion and Archive because some addon managers interfere with it
EnableAddOn("WeakAurasCompanion")
EnableAddOn("WeakAurasArchive")

local libsAreOk = true
do
  local StandAloneLibs = {
    "Archivist",
    "LibStub"
  }
  local LibStubLibs = {
    "CallbackHandler-1.0",
    "AceTimer-3.0",
    "AceSerializer-3.0",
    "AceComm-3.0",
    "LibSharedMedia-3.0",
    "LibDataBroker-1.1",
    "LibCompress",
    "SpellRange-1.0",
    "LibCustomGlow-1.0",
    "LibDBIcon-1.0",
    "LibGetFrame-1.0",
    "LibSerialize",
    "LibGroupTalents-1.0",
  }
  for _, lib in ipairs(StandAloneLibs) do
    if not lib then
        libsAreOk = false
        WeakAuras.prettyPrint("Missing library:", lib)
    end
  end
  if LibStub then
    for _, lib in ipairs(LibStubLibs) do
        if not LibStub:GetLibrary(lib, true) then
          libsAreOk = false
          WeakAuras.prettyPrint("Missing library:", lib)
        end
    end
  else
    libsAreOk = false
  end
end

function WeakAuras.IsLibsOK()
  return libsAreOk
end

if not libsAreOk then
  WeakAuras.prettyPrint("WeakAuras is missing necessary libraries. Please reinstall a proper package.")
end

-- CoA uses its own plain release versions; no upstream Beta suffix.
-- Only warn when the actual packaged code and TOC versions disagree.
if versionStringFromToc and versionStringFromToc ~= "Dev"
    and versionString ~= versionStringFromToc
    then
  WeakAuras.prettyPrint("WeakAuras version mismatch detected. Check that all addon folders were updated together.")
end

if not WeakAuras.IsLibsOK() then
  WeakAuras.prettyPrint("WeakAuras is missing necessary libraries. Please reinstall a proper package.")
end

-- These function stubs are defined here to reduce the number of errors that occur if WeakAuras.lua fails to compile
function Private.RegisterRegionType(_, _, _ ,_)
end

function Private.RegisterRegionOptions(_, _ , _ ,_)
end

function Private.StartProfileSystem(_)
end

function Private.StartProfileAura(_)
end

function Private.StopProfileSystem(_)
end

function Private.StopProfileAura(_)
end

function Private.StartProfileUID()
end

function Private.StopProfileUID()
end

Private.ExecEnv = {}

-- If WeakAuras shuts down due to being installed on the wrong target, keep the bindings from erroring
function WeakAuras.StartProfile(_)
end

function WeakAuras.StopProfile()
end

function WeakAuras.PrintProfile()
end

function WeakAuras.CountWagoUpdates()
  -- XXX this is to work around the Companion app trying to use our stuff!
  return 0
end

function WeakAuras.Mixin(object, ...)
  for i = 1, select("#", ...) do
    local mixin = select(i, ...)
    for k, v in pairs(mixin) do
      object[k] = v
    end
  end
  return object
end
