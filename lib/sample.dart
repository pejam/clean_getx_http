/*
onPressed: () async {
if (_curProject == null) return;
FilePickerResult? pickedFile =
await FilePicker.platform.pickFiles(
allowMultiple: false,
type: FileType.custom,
allowedExtensions: ['xlsx'],
);
if (pickedFile != null) {
setState(() {
_loading = true;
});
var runningProject =
await TWIProject.getProjectById(
settingsController:
widget.settingsController,
id: _curProject!.id);
setState(() {
_loading = false;
});
if (TWIProject.serviceError.isNotEmpty) {
if (!mounted) return;
await alert(context, 'خطا',
TWIProject.serviceError);
return;
}

setState(() {
_loading = true;
});

int res = await TWIProject.runProject(
settingsController:
widget.settingsController,
project: runningProject!,
workspaceId: _curCompany!.id,
fpId: _curFPId!.id,
fileName: pickedFile.files.single.name,
log: true,
bytes: pickedFile.files.single.bytes,
parameters: runningProject.parameters);
TWISession? session;
if (res > 0) {
session = await TWISession.getSession(
settingsController:
widget.settingsController,
id: res);
session!.project = _projects.singleWhere(
(p) => p.id == session!.projectId);
}
setState(() {
_loading = false;
});

if (TWIProject.serviceError.isNotEmpty) {
if (!mounted) return;
await alert(context, 'خطا',
TWIProject.serviceError);
return;
}
if (!mounted) return;
await Navigator.push(
context,
MaterialPageRoute(
builder: (context) => LogsPage(
settingsController:
widget.settingsController,
session: session!)));
}
}),




static Future<int> runProject(
{required SettingsController settingsController,
required TWIProject project,
required int workspaceId,
required int fpId,
required String fileName,
required bool log,
required Uint8List? bytes,
required List<TWIParameter>? parameters,
bool error401 = false}) async {
serviceError = '';
var loggonuser = settingsController.loggonuser;
if (loggonuser == null) {
serviceError = 'لطفاً مجدداً وارد شوید.';
return 0;
}

try {
var request = http.MultipartRequest(
'POST',
Uri.parse(
'${settingsController.protocol}://${settingsController.server}:${settingsController.port}/api/import/run'));
request.files.add(http.MultipartFile.fromBytes('inputfile', bytes!,
filename: fileName));
request.fields['projectId'] = project.id.toString();
request.fields['workspaceId'] = workspaceId.toString();
request.fields['fpId'] = fpId.toString();
request.fields['sheetIndex'] = (project.sheetOrder - 1).toString();
request.fields['skipRows'] = project.ignoreTopRows.toString();
request.fields['rowLimit'] = project.dataRowsCount.toString();
request.fields['log'] = log.toString();
var paramValuesStr = '';
if (parameters != null) {
for (var paramValue in parameters) {
if (paramValuesStr.isNotEmpty) {
paramValuesStr += r'$';
}
paramValuesStr += paramValue.value;
}
}
request.fields['paramValues'] = paramValuesStr;

request.headers.addAll({
'Content-Type': 'application/json; charset=UTF-8',
HttpHeaders.authorizationHeader: 'bearer ${loggonuser.token}'
});

var response = await request.send();

if (!error401 && response.statusCode == 401) {
if ((await AuthController()
    .renewSession(settingsController: settingsController)) !=
null) {
return await runProject(
settingsController: settingsController,
project: project,
workspaceId: workspaceId,
fpId: fpId,
bytes: bytes,
fileName: fileName,
log: log,
parameters: parameters,
error401: true);
} else {
serviceError = 'لطفاً مجدداً وارد شوید.';
return 0;
}
}
if (response.statusCode == 200) {
return int.parse(await response.stream.bytesToString());
} else {
serviceError = await response.stream.bytesToString();
return 0;
}
} catch (e) {
serviceError = e.toString();
return 0;
}
}*/
