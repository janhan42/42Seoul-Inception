# Inception

### General Guidelines<br>
<ul>
	<li>이 프로젝트는 가상 머신(Virtual Machine)에서 수행해야 합니다.</li>
	<li>프로젝트 설정에 필요한 모든 파일은 <b>srcs</b> 폴더에 배치해야 합니다.</li>
	<li>Makefile을 생성하여 프로젝트 루트 디렉토리에 위치시켜야 합니다.</li>
	<li>Makefile은 전체 애플리케이션을 설정해야 하며, docker-compose.yml을 사용하여 Docker 이미지를 빌드해야 합니다.</li>
	<li>이 주제는 여러분의 배경 지식에 따라 아직 배우지 않은 개념을 실습해야 할 수 있습니다.</li>
	<li>따라서 Docker 사용법과 관련된 문서나 이 과제를 완료하는 데 유용한 자료를 많이 읽는 것을 주저하지 말 것을 권장합니다.</li>
</ul>
<br>

## 필수 요구 사항
> 이 프로젝트는 특정 규칙에 따라 여러 서비스를 포함하는 작은 인프라를 설정하는 것을 목표로 합니다.

### 프로젝트 환경 및 도구
<ul>
	<li>모든 작업은 <b>가상 머신(Virtual Machine)</b> 에서 수행해야 합니다.</li>
	<li>반드시 <b>Docker Compose</b>를 사용해야 합니다.</li>
</ul>

### Docker 이미지 및 컨테이너 규칙
<ul>
	<li>각 Docker 이미지는 해당 서비스와 동일한 이름을 가져야 합니다.</li>
	<li>각 서비스는 전용 컨테이너에서 실행되어야 합니다.</li>
</ul>

### 이미지 구축 규칙
<ul>
	<li>컨테이너는 성능을 위해 Alpine 또는 Debian의 마지막 이전 안정 버전을 기반으로 빌드해야 합니다. (선택은 자유)</li>
	<li>각 서비스마다 Dockerfile을 작성해야 하며, 각 Dockerfile은 Makefile에 의해 docker-compose.yml 파일에서 호출되어야 합니다.</li>
	<li>즉, 프로젝트의 Docker 이미지를 직접 빌드해야 합니다. 따라서 미리 만들어진 Docker 이미지를 가져오는 것은 금지되며, DockerHub와 같은 서비스를 사용하는 것도 금지됩니다. (단, Alpine/ Debian 이미지는 이 규칙에서 제외됩니다.)</li>
</ul>

### 설정해야 할 항목

<ul>
	<li>NGINX를 포함하는 Docker 컨테이너 (TLSv1.2 또는 TLSv1.3만 지원).
	<br>A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.</li>
	<li>NGINX 없이 WordPress + php-fpm을 포함하는 Docker 컨테이너 (nginx는 포함하지 않음).
	<br>A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.</li>
	<li>MariaDB를 포함하는 Docker 컨테이너 (nginx는 포함하지 않음).
	<br>A Docker container that contains MariaDB only without nginx</li>
	<li>WordPress 데이터베이스를 포함하는 볼륨.
	<br>A volume that contains your WordPress database.</li>
	<li>WordPress 웹사이트 파일을 포함하는 두 번째 볼륨
	<br>A second volume that contains your WordPress website files</li>
	<li>컨테이너 간 연결을 위한 <b>Docker-network</b>.
	<br>A <b>docker-network</b> that establishes the connection between your containers.</li>
</ul>
<b>컨테이너는 충돌 시 자동 재시작해야 합니다.</b>


## ℹ️
<ul>
	<li> Docker 컨테이너는 가상 머신이 아닙니다. 따라서, 컨테이너를 실행할 때 tail -f와 같은 임시적이고 비효율적인 해결책(hacky patch)을 사용하는 것은 권장되지 않습니다.</li>
	<li>데몬(daemon)의 작동 방식에 대해 읽어보고, 이를 사용하는 것이 적절한지 판단하십시오.</li>
</ul>

## ⚠️
	물론, network: host, --link, 또는 links:의 사용은 금지됩니다.
	네트워크 설정은 반드시 docker-compose.yml 파일에 포함되어야 합니다.
	컨테이너는 무한 루프를 실행하는 명령어로 시작되어서는 안 됩니다.
	이는 entrypoint로 사용된 명령어와 entrypoint 스크립트에 사용된 명령어에도 적용됩니다.
	다음은 금지된 비정상적인 패치(hacky patches) 예시입니다: tail -f, bash, sleep infinity, while true.

## ℹ️

