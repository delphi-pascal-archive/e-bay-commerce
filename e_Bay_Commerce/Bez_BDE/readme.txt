BDE32 component - freeware

The main feature of this component is the ability to run applications without the BDE installed.  Fed up with the error "Cannot load the DataBase engine" when users run your application on a different computer.  Well BDE32 will take care of that for you.  Provided you have a BDE subdirectory under the application directory, the app can be run on any machine, locally or through the network.  This means that if you install a progam on a server everyone can double-click on it and it will run.

Note:

1. Component Installation: as usual.
2. Use:  BDE32 has two uses - to run an application without installing the BDE and to control vital sections of the BDE without the need for BDEADMIN.EXE and without the user knowing about them.
2.1 How to use BDE32 to run an application without the BDE:
	1. Create your executable using your BDE
	2. Drop the BDE32 component on your main form
	3. Include a subdirectory called BDE with the appropriate files from your BDE directory - See section 6
	4. You can now ship your app - with the BDE subdirectory and it will set up the BDE for you
	5. If you run your app over a network you can do so without installing the BDE on any client
2.2 How to use BDE32 to control the BDE settings:
	1. Drop a BDE32 onto your main form 
	2. In formcreate do something like this:
           with BDE32 do
            begin
             ReadSettings;
             LocalShare:=true;
             PDXNetDir:='G:\';
             WriteSettings;
            end;
	3. This ensures that you have control over the settings
3. methods:  ReadSettings, WriteSettings - gets/puts idapi32.cfg
4. properties:  see design time, but these cannot be set until writesettings is called.
5. Source: Source can be obtained at http://www.kestrelsoftware.co.uk
6. BDE subdirectory: Basically you need to work out the files you need by trial and error. You need idapi32.cfg, idapi32.dll, bantam.dll, idr20009.dll and idpdx32.dll for a paradox setup.