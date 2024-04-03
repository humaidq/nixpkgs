{ lib
, buildPythonPackage
, cryptography
, fetchPypi
, impacket
, lxml
, poetry-core
, pyasn1
, pythonOlder
, pythonRelaxDepsHook
}:

buildPythonPackage rec {
  pname = "dploot";
  version = "2.7.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-76+cTukQOXE8tjaBrWVJY56+zVO5yqB5BT9q7+TBpnA=";
  };

  pythonRelaxDeps = [
    "cryptography"
    "lxml"
    "pyasn1"
  ];

  nativeBuildInputs = [
    pythonRelaxDepsHook
  ];

  build-system = [
    poetry-core
  ];

  dependencies = [
    impacket
    cryptography
    pyasn1
    lxml
  ];

  pythonImportsCheck = [
    "dploot"
  ];

  # No tests
  doCheck = false;

  meta = with lib; {
    description = "DPAPI looting remotely in Python";
    homepage = "https://github.com/zblurx/dploot";
    changelog = "https://github.com/zblurx/dploot/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ vncsb ];
    mainProgram = "dploot";
  };
}
