-- D³ Developer Plugin Loader
-- A simple developer plugin to help re/load plugins

local parent = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__GAME_AREA);

local pluginName = nil;


local component_1 = prettyui.Window.new(parent, { title = "D³ - Dev Loader window", x = 10, y = 10, width = 440, height = 340, rowBackgroundColours = { 0x24211EFF, 0x2E2825FF } });
component_1:AddText("Developer plugin to help re/load plugins.");

local function rlfuncW1(button, active) 
    local bs1 = "plugins_reload " .. tostring(pluginName);
    ExecuteConsoleCommand(bs1);
end
component_1:AddSimpleButton("Simple reload - [ prl ]", rlfuncW1);

local function rlfuncW2(button, active) 
    local bs1 = "plugins_refresh";
    local bs2 = "plugins_reload " .. tostring(pluginName);
    ExecuteConsoleCommand(bs1);
    ExecuteConsoleCommand(bs2);
end
component_1:AddSimpleButton("Full reload - [ prf, prl ]", rlfuncW2);

local function rlfuncW3(button, active) 
    local bs1 = "prf"; --plugins_refresh
    local bs2 = "ppr " .. tostring(pluginName); --plugins_permissions_request
    local bs3 = "ppe " .. tostring(pluginName) .. " httpAccess";  --plugins_permissions_enable
    local bs4 = "ppe " .. tostring(pluginName) .. " chatAccess";  --plugins_permissions_enable
    local bs5 = "ppe " .. tostring(pluginName) .. " trackingAccess";  --plugins_permissions_enable
    local bs6 = "prl " .. tostring(pluginName); --plugins_reload
    ExecuteConsoleCommand(bs1);
    ExecuteConsoleCommand(bs2);
    ExecuteConsoleCommand(bs3);
    ExecuteConsoleCommand(bs4);
    ExecuteConsoleCommand(bs5);
    ExecuteConsoleCommand(bs6);
end
component_1:AddSimpleButton("Reload w/ Full PPE - [ prf, ppr, ppe, prl ]", rlfuncW3);

component_1:AddDivider({ rowBackgroundGroup = "component_5" });
local setTextW = component_1:AddText({ text = "P-NAME: Unset.", rowBackgroundGroup = "component_5" });
if pluginName  ~= nil then
    setTextW.content = "P-NAME: " .. tostring(pluginName);
end

local varTextField1W = component_1:AddTextField({ placeholder = "Enter Plugin" });
local function Won_component_3_click(button, active)
    pluginName = varTextField1W:GetText();
    setTextW.content = "P-NAME: " .. tostring(pluginName);
end
component_1:AddSimpleButton("Set P-NAME", Won_component_3_click);

component_1:AddDivider();
component_1:AddText("Exec commands:");
local varTextField1W = component_1:AddTextField({ placeholder = "Enter console command" });
local function consoleCommandButton(button, active)
    ExecuteConsoleCommand(tostring(varTextField1W:GetText()));
end
component_1:AddSimpleButton("Exec command", consoleCommandButton);
    
component_1:RefreshRowBackgrounds();



local contentView;
Event.ContentLayerReady.Subscribe("d3-plugin-ribbon-content", function(event)
    if contentView then contentView:Destroy() end

    local parent = event.component;
    contentView = prettyui.SimpleView.new(parent, {
        width = parent.width,
        height = parent.height,
    });

    contentView:AddTitle("D³ - Dev Loader");
    contentView:AddText("Developer plugin to help re/load plugins.");

    local function rlfunc1(button, active) 
       local bs1 = "plugins_reload " .. tostring(pluginName);
       ExecuteConsoleCommand(bs1);
    end
    contentView:AddSimpleButton("Simple reload - [ prl ]", rlfunc1);
    
    local function rlfunc2(button, active) 
        local bs1 = "plugins_refresh";
        local bs2 = "plugins_reload " .. tostring(pluginName);
        ExecuteConsoleCommand(bs1);
        ExecuteConsoleCommand(bs2);
    end
    contentView:AddSimpleButton("Full reload - [ prf, prl ]", rlfunc2);
    
    local function rlfunc3(button, active) 
       local bs1 = "prf"; --plugins_refresh
       local bs2 = "ppr " .. tostring(pluginName); --plugins_permissions_request
       local bs3 = "ppe " .. tostring(pluginName) .. " httpAccess";  --plugins_permissions_enable
       local bs4 = "ppe " .. tostring(pluginName) .. " chatAccess";  --plugins_permissions_enable
       local bs5 = "ppe " .. tostring(pluginName) .. " trackingAccess";  --plugins_permissions_enable
       local bs6 = "prl " .. tostring(pluginName); --plugins_reload
       ExecuteConsoleCommand(bs1);
       ExecuteConsoleCommand(bs2);
       ExecuteConsoleCommand(bs3);
       ExecuteConsoleCommand(bs4);
       ExecuteConsoleCommand(bs5);
       ExecuteConsoleCommand(bs6);
    end
    contentView:AddSimpleButton("Reload w/ Full PPE", rlfunc3);
    
    
    contentView:AddDivider({ rowBackgroundGroup = "component_2" });
    local setText = contentView:AddText({ text = "P-NAME: Unset.", rowBackgroundGroup = "component_2" });
    if pluginName  ~= nil then
        setText.content = "P-NAME: " .. tostring(pluginName);
    end

    local varTextField1 = contentView:AddTextField({ placeholder = "Enter Plugin" });
    local function on_component_3_click(button, active)
        pluginName = varTextField1:GetText();
        setText.content = "P-NAME: " .. tostring(pluginName);
    end
    contentView:AddSimpleButton("Set P-NAME", on_component_3_click);
    
    contentView:AddDivider();
    local function showWinfunc(button, active) 
       component_1:Show();
    end
    contentView:AddSimpleButton("Open window view", showWinfunc);
    
end);



function PluginShutdown()

    --main window
    component_1:Destroy();

    --'ribbon' pane content
    Event.ContentLayerReady.Unsubscribe("d3-plugin-ribbon-content");
    if contentView then
        contentView:Destroy();
        contentView = nil;
    end
    
end
