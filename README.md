# Codyssey Week 1

## 1. 프로젝트 개요

터미널, Docker, Git/GitHub를 활용하여 재현 가능한 개발 워크스테이션을 구축하고, 실행 과정과 검증 결과를 문서화하는 미션입니다.

## 2. 실행 환경

- OS: macOS
- Architecture: Apple Silicon ARM64
- Shell: zsh
- Terminal: macOS Terminal
- Docker Client: 28.1.1
- Docker Context: desktop-linux
- Git: 2.51.0

## 3. 수행 체크리스트

- [ ] 터미널 기본 조작
- [ ] 파일 및 디렉토리 권한 실습
- [ ] Docker 실행 환경 점검
- [ ] hello-world 컨테이너 실행
- [ ] Ubuntu 컨테이너 실습
- [ ] Dockerfile 기반 커스텀 이미지 제작
- [ ] 포트 매핑 검증
- [ ] 바인드 마운트 검증
- [ ] Docker 볼륨 영속성 검증
- [ ] Git 및 GitHub 연동
- [ ] 트러블슈팅 2건 이상 작성

## 4. 터미널 기본 조작

터미널에서 디렉토리와 파일을 생성하고, 복사·이동·삭제하는 기본 명령어를 실습했습니다.

### 4.1 현재 위치와 파일 목록 확인

`pwd` 명령으로 현재 작업 중인 디렉토리의 절대 경로를 확인하고, `ls -la` 명령으로 숨김 파일을 포함한 전체 파일 목록을 확인했습니다.

```bash
pwd
ls -la
```

![현재 위치와 파일 목록 확인](./images/terminal-practice/cd_pwd.png)

### 4.2 파일과 디렉토리 생성

`mkdir` 명령으로 `sample-dir` 디렉토리를 생성하고, `touch` 명령으로 `original.txt` 파일을 생성했습니다.

이후 출력 리다이렉션인 `>`를 사용하여 `original.txt` 파일에 `Hello Codyssey` 문자열을 작성했습니다.

```bash
mkdir sample-dir
touch original.txt
echo "Hello Codyssey" > original.txt
ls -la
cat original.txt
```

![파일과 디렉토리 생성](./images/terminal-practice/파일과디렉토리생성.png)

### 4.3 파일 복사

`cp` 명령을 사용하여 `original.txt` 파일을 `copied.txt`라는 이름으로 복사했습니다.

```bash
cp original.txt copied.txt
ls -la
```

![파일 복사](./images/terminal-practice/파일복사.png)

### 4.4 파일 이름 변경 및 이동

`mv` 명령을 사용하여 `copied.txt` 파일의 이름을 `renamed.txt`로 변경했습니다.

이후 같은 `mv` 명령을 사용해 `renamed.txt` 파일을 `sample-dir` 디렉토리로 이동했습니다.

```bash
mv copied.txt renamed.txt
mv renamed.txt sample-dir/
ls -la
ls -la sample-dir
```

![파일 이름 변경 및 이동](./images/terminal-practice/파일이름변경및이동.png)

### 4.5 파일 내용 확인

`cat` 명령으로 `sample-dir` 디렉토리 안에 있는 `renamed.txt` 파일의 내용을 확인했습니다.

```bash
cat sample-dir/renamed.txt
```

```text
Hello Codyssey
```

![파일 내용 확인](./images/terminal-practice/파일내용확인.png)

### 4.6 파일과 디렉토리 삭제

`rm` 명령으로 `sample-dir` 내부의 `renamed.txt` 파일을 삭제했습니다.

파일을 삭제한 뒤 비어 있는 `sample-dir` 디렉토리는 `rmdir` 명령으로 삭제했습니다.

```bash
rm sample-dir/renamed.txt
rmdir sample-dir
ls -la
```

![파일과 디렉토리 삭제](./images/terminal-practice/파일과디렉토리삭제.png)

실습이 끝난 후에는 최초에 생성한 `original.txt` 파일만 남겨 두었습니다.

현재 터미널 실습 디렉토리의 구조는 다음과 같습니다.

```text
terminal-practice/
└── original.txt
```

### 4.7 절대 경로와 상대 경로

절대 경로는 루트 디렉토리부터 특정 파일이나 디렉토리까지의 전체 위치를 표현한 경로입니다.

현재 프로젝트의 `original.txt` 파일을 절대 경로로 표현하면 다음과 같은 형태가 됩니다.

```text
/Users/<username>/<workspace>/codyssey-week-1/terminal-practice/original.txt
```

사용자 이름과 프로젝트를 저장한 상위 디렉토리는 실행 환경에 따라 달라질 수 있습니다.

상대 경로는 현재 작업 중인 디렉토리를 기준으로 파일이나 디렉토리의 위치를 표현합니다.

현재 위치가 프로젝트 루트인 `codyssey-week-1`이라면 다음 상대 경로로 `original.txt` 파일을 표현할 수 있습니다.

```text
./terminal-practice/original.txt
```

현재 위치가 `terminal-practice`라면 다음과 같이 표현할 수 있습니다.

```text
./original.txt
```

`terminal-practice`에서 상위 디렉토리에 있는 `README.md`는 다음 상대 경로로 접근할 수 있습니다.

```text
../README.md
```

정리하면 다음과 같습니다.

| 표현 | 의미 |
|---|---|
| `/Users/.../original.txt` | 루트부터 시작하는 절대 경로 |
| `./original.txt` | 현재 디렉토리에 있는 파일 |
| `../README.md` | 현재 디렉토리의 상위 디렉토리에 있는 파일 |

### 4.8 프로젝트 디렉토리 구조

터미널 기본 조작 실습을 완료한 후의 프로젝트 구조는 다음과 같습니다.

```text
.
├── README.md
├── images
│   └── terminal-practice
│       ├── cd_pwd.png
│       ├── 파일과디렉토리삭제.png
│       ├── 파일과디렉토리생성.png
│       ├── 파일내용확인.png
│       ├── 파일복사.png
│       └── 파일이름변경및이동.png
└── terminal-practice
    └── original.txt
```

## 5. 파일 및 디렉토리 권한 실습

macOS는 Unix 기반 운영체제이므로 `ls`와 `chmod` 명령을 사용해 파일 및 디렉토리 권한을 확인하고 변경할 수 있습니다.

이번 실습에서는 파일의 실행 권한 유무를 비교하고, 파일과 디렉토리의 권한을 각각 변경했습니다.

### 5.1 권한 실습 환경 구성

권한 실습을 위해 `permission-practice` 디렉토리 아래에 `sample.sh` 파일과 `sample-dir` 디렉토리를 생성했습니다.

```bash
mkdir -p permission-practice/sample-dir
touch permission-practice/sample.sh
echo 'echo "Hello Permission"' > permission-practice/sample.sh

cd permission-practice
tree -a
```

```text
.
├── sample-dir
└── sample.sh
```

### 5.2 변경 전 권한 확인

`ls -l` 명령으로 파일 권한을 확인하고, `ls -ld` 명령으로 디렉토리 자체의 권한을 확인했습니다.

```bash
ls -l sample.sh
ls -ld sample-dir
```

![권한 변경 전](./images/permission-practice/권한변경전.png)

`ls -l`에 표시되는 권한은 다음과 같은 형태로 구성됩니다.

```text
-rw-r--r--
```

첫 번째 문자는 파일의 종류를 의미합니다.

| 문자 | 의미 |
|---|---|
| `-` | 일반 파일 |
| `d` | 디렉토리 |

이후의 아홉 문자는 세 자리씩 나뉘며 각각 소유자, 그룹, 기타 사용자의 권한을 나타냅니다.

```text
- | rw- | r-- | r--
    소유자  그룹  기타 사용자
```

macOS에서는 파일 권한 뒤에 `@`가 표시될 수 있습니다.

```text
-rw-r--r--@
```

`@`는 해당 파일에 macOS 확장 속성이 설정되어 있음을 의미하며, 기본적인 `r`, `w`, `x` 권한에는 영향을 주지 않습니다.

### 5.3 실행 권한이 없는 파일 실행

초기 상태의 `sample.sh` 파일에는 실행 권한인 `x`가 없었습니다.

실행 권한이 없는 상태에서 파일을 직접 실행했습니다.

```bash
./sample.sh
```

```text
zsh: permission denied: ./sample.sh
```

![실행 권한 없음](./images/permission-practice/실행권한없음.png)

파일 내용은 존재하지만 실행 권한이 없으므로, 운영체제가 파일 실행을 허용하지 않았습니다.

### 5.4 파일 권한을 755로 변경

`chmod` 명령을 사용하여 `sample.sh` 파일의 권한을 `755`로 변경했습니다.

```bash
chmod 755 sample.sh
ls -l sample.sh
```

변경 후 권한은 다음과 같습니다.

```text
-rwxr-xr-x
```

![파일 권한 755 변경](./images/permission-practice/파일권한변경1.png)

실행 권한이 추가된 뒤 파일을 다시 실행했습니다.

```bash
./sample.sh
```

```text
Hello Permission
```

![실행 권한 추가 후 실행](./images/permission-practice/파일권한변경2.png)

`755` 권한에서는 소유자뿐만 아니라 그룹과 기타 사용자도 파일을 실행할 수 있습니다.

### 5.5 파일 권한을 644로 변경

실행 권한 실습을 마친 뒤 `sample.sh` 파일의 권한을 일반적인 문서 파일 권한인 `644`로 변경했습니다.

```bash
chmod 644 sample.sh
ls -l sample.sh
```

```text
-rw-r--r--
```

`644` 권한에서는 소유자만 파일을 수정할 수 있고, 그룹과 기타 사용자는 파일을 읽을 수만 있습니다.

실행 권한인 `x`가 제거되었기 때문에 파일을 직접 실행할 수는 없습니다.

### 5.6 디렉토리 권한 변경

디렉토리 권한 변경을 확인하기 위해 `sample-dir`의 권한을 먼저 `700`으로 변경했습니다.

```bash
chmod 700 sample-dir
ls -ld sample-dir
```

```text
drwx------
```

`700` 권한에서는 디렉토리 소유자만 해당 디렉토리를 조회하고, 수정하고, 접근할 수 있습니다.

이후 디렉토리 권한을 일반적으로 사용되는 `755`로 다시 변경했습니다.

```bash
chmod 755 sample-dir
ls -ld sample-dir
```

```text
drwxr-xr-x
```

![디렉토리 권한 변경](./images/permission-practice/디렉토리권한변경.png)

디렉토리에서 실행 권한인 `x`는 파일 실행이 아니라 해당 디렉토리 내부로 이동하거나 내부 항목에 접근할 수 있는 권한을 의미합니다.

### 5.7 `r`, `w`, `x` 권한의 의미

| 권한 | 숫자 | 파일에서의 의미 | 디렉토리에서의 의미 |
|---|---:|---|---|
| `r` | 4 | 파일 내용 읽기 | 디렉토리 내부 목록 확인 |
| `w` | 2 | 파일 내용 수정 | 파일 및 디렉토리 생성·삭제 |
| `x` | 1 | 파일 실행 | 디렉토리 내부 접근 및 이동 |

파일과 디렉토리는 같은 권한 기호를 사용하지만, 대상에 따라 권한의 의미가 달라집니다.

### 5.8 숫자 권한 표기 방식

숫자 권한은 `r`, `w`, `x`에 해당하는 숫자를 더하여 계산합니다.

```text
r = 4
w = 2
x = 1
```

각 숫자는 소유자, 그룹, 기타 사용자의 순서로 적용됩니다.

#### 755 권한

```text
7 = 4 + 2 + 1 = rwx
5 = 4 + 0 + 1 = r-x
5 = 4 + 0 + 1 = r-x
```

따라서 `755`는 다음 권한을 의미합니다.

```text
rwxr-xr-x
```

| 사용자 구분 | 권한 |
|---|---|
| 소유자 | 읽기, 쓰기, 실행 |
| 그룹 | 읽기, 실행 |
| 기타 사용자 | 읽기, 실행 |

#### 644 권한

```text
6 = 4 + 2 + 0 = rw-
4 = 4 + 0 + 0 = r--
4 = 4 + 0 + 0 = r--
```

따라서 `644`는 다음 권한을 의미합니다.

```text
rw-r--r--
```

| 사용자 구분 | 권한 |
|---|---|
| 소유자 | 읽기, 쓰기 |
| 그룹 | 읽기 |
| 기타 사용자 | 읽기 |

### 5.9 권한 실습 결과

파일에 실행 권한이 없을 때는 `permission denied` 오류가 발생했습니다.

이후 `chmod 755`를 적용해 실행 권한을 추가하자 `sample.sh` 파일이 정상적으로 실행되었습니다.

또한 파일에는 주로 `644`, 실행 파일이나 디렉토리에는 주로 `755` 권한이 사용되는 이유를 확인했습니다.

### 5.10 프로젝트 디렉토리 구조

권한 실습을 완료한 후 프로젝트 구조는 다음과 같습니다.

```text
.
├── README.md
├── images
│   ├── permission-practice
│   │   ├── 권한변경전.png
│   │   ├── 디렉토리권한변경.png
│   │   ├── 실행권한없음.png
│   │   ├── 파일권한변경1.png
│   │   └── 파일권한변경2.png
│   └── terminal-practice
│       ├── cd_pwd.png
│       ├── 파일과디렉토리삭제.png
│       ├── 파일과디렉토리생성.png
│       ├── 파일내용확인.png
│       ├── 파일복사.png
│       └── 파일이름변경및이동.png
├── permission-practice
│   ├── sample-dir
│   └── sample.sh
└── terminal-practice
    └── original.txt
```

## 6. Docker 설치 및 기본 점검

Docker Desktop을 이용해 macOS에서 Docker 컨테이너 실행 환경을 구성했습니다.

Docker CLI 설치 여부와 Docker 엔진의 동작 상태를 확인한 뒤, `hello-world` 컨테이너를 실행하여 이미지 다운로드부터 컨테이너 종료까지의 흐름을 확인했습니다.

### 6.1 Docker 실행 환경

이번 실습에서 사용한 Docker 환경은 다음과 같습니다.

| 항목 | 실행 환경 |
|---|---|
| 운영체제 | macOS |
| CPU 아키텍처 | Apple Silicon ARM64 |
| Docker 실행 환경 | Docker Desktop |
| Docker Client | 28.1.1 |
| Docker API | 1.49 |
| Docker Context | `desktop-linux` |
| Git | 2.51.0 |

### 6.2 Docker 버전 확인

`docker --version` 명령으로 Docker CLI의 설치 여부와 버전을 확인했습니다.

```bash
docker --version
```

```text
Docker version 28.1.1
```

Client와 Server의 상세 정보는 다음 명령으로 확인했습니다.

```bash
docker version
```

Docker Client 정보뿐만 아니라 Server 정보도 함께 출력되는 것을 통해 Docker CLI와 Docker 엔진이 정상적으로 연결되어 있음을 확인했습니다.

![Docker 버전 확인](./images/docker-practice/docker-version.png)

### 6.3 Docker 엔진 동작 확인

`docker info` 명령으로 Docker Context와 Docker 엔진의 실행 상태를 확인했습니다.

```bash
docker info
```

확인한 주요 항목은 다음과 같습니다.

- Docker Client 버전
- 현재 Docker Context
- Docker Server 버전
- 이미지 및 컨테이너 개수
- Docker Desktop 실행 환경
- Docker Compose 등 설치된 플러그인

![Docker 엔진 동작 확인](./images/docker-practice/docker-info.png)

출력 결과에서 현재 Context가 `desktop-linux`로 설정되어 있었으며, Docker Server 정보가 정상적으로 출력되었습니다.

Docker Context는 다음 명령으로도 확인할 수 있습니다.

```bash
docker context ls
```

```text
NAME              DESCRIPTION                               DOCKER ENDPOINT
default           Current DOCKER_HOST based configuration
desktop-linux *   Docker Desktop
```

`*` 표시는 현재 사용 중인 Docker Context를 의미합니다.

### 6.4 Docker 데몬 연결 실패 트러블슈팅

#### 문제

최초로 `docker info` 명령을 실행했을 때 다음 오류가 발생했습니다.

```text
Cannot connect to the Docker daemon at unix:///Users/<username>/.docker/run/docker.sock.
Is the docker daemon running?
```

Docker 버전은 정상적으로 출력됐지만 Docker Server 정보는 확인할 수 없었습니다.

#### 원인 가설

Docker CLI는 설치되어 있었지만 실제 컨테이너를 관리하는 Docker 엔진이 실행되지 않은 것으로 판단했습니다.

현재 Docker Context는 `desktop-linux`였으므로 Docker Desktop의 엔진 상태를 확인했습니다.

#### 확인

다음 명령으로 Docker Context를 확인했습니다.

```bash
docker context ls
```

또한 macOS에서 Docker Desktop 애플리케이션의 실행 여부를 확인했습니다.

#### 해결

Docker Desktop을 실행하고 Docker 엔진이 완전히 시작될 때까지 기다린 뒤 `docker info`를 다시 실행했습니다.

```bash
docker info
```

#### 결과

Docker Server 정보가 정상적으로 출력되었으며, Docker CLI가 Docker 엔진과 정상적으로 연결된 것을 확인했습니다.

이번 문제를 통해 Docker CLI 설치와 Docker 엔진 실행은 서로 다른 상태라는 것을 확인했습니다.

### 6.5 `hello-world` 컨테이너 실행

Docker 컨테이너가 정상적으로 실행되는지 확인하기 위해 `hello-world` 이미지를 사용했습니다.

```bash
docker run --name hello-world-test hello-world
```

로컬 환경에 `hello-world` 이미지가 없었기 때문에 Docker가 이미지를 자동으로 다운로드한 뒤 컨테이너를 생성하고 실행했습니다.

```text
Hello from Docker!
```

![hello-world 실행](./images/docker-practice/hello-world.png)

`hello-world` 컨테이너의 실행 과정은 다음과 같습니다.

1. 로컬에 `hello-world` 이미지가 있는지 확인합니다.
2. 이미지가 없으면 Docker Hub에서 다운로드합니다.
3. 다운로드한 이미지로 컨테이너를 생성합니다.
4. 컨테이너 내부 프로그램을 실행합니다.
5. `Hello from Docker!` 메시지를 출력합니다.
6. 작업 완료 후 컨테이너가 종료됩니다.

### 6.6 Docker 이미지 목록 확인

`docker images` 명령으로 로컬에 저장된 Docker 이미지 목록을 확인했습니다.

```bash
docker images
```

목록에서 `hello-world` 이미지가 다운로드된 것을 확인했습니다.

![Docker 이미지 목록](./images/docker-practice/docker-images.png)

Docker 이미지는 컨테이너를 생성하기 위한 읽기 전용 템플릿입니다. 하나의 이미지로 여러 컨테이너를 생성할 수 있습니다.

### 6.7 컨테이너 목록 확인

현재 실행 중인 컨테이너를 확인했습니다.

```bash
docker ps
```

`hello-world` 컨테이너는 메시지를 출력한 뒤 바로 종료되므로 실행 중인 컨테이너 목록에는 표시되지 않았습니다.

종료된 컨테이너를 포함한 전체 컨테이너 목록은 `-a` 옵션으로 확인했습니다.

```bash
docker ps -a
```

`hello-world-test` 컨테이너가 다음과 같이 정상 종료된 상태로 표시되었습니다.

```text
Exited (0)
```

`Exited (0)`은 컨테이너 내부 프로세스가 오류 없이 정상적으로 종료됐다는 의미입니다.

![전체 컨테이너 목록](./images/docker-practice/docker-ps-a.png)

### 6.8 컨테이너 로그 확인

`docker logs` 명령으로 컨테이너가 실행될 때 출력한 로그를 다시 확인했습니다.

```bash
docker logs hello-world-test
```

```text
Hello from Docker!
```

![Docker 컨테이너 로그](./images/docker-practice/docker-logs.png)

컨테이너가 종료된 이후에도 삭제하지 않았다면 실행 당시의 로그를 확인할 수 있습니다.

### 6.9 실행 중인 컨테이너 리소스 확인

`hello-world` 컨테이너는 바로 종료되기 때문에 별도의 Alpine 컨테이너를 백그라운드에서 실행했습니다.

```bash
docker run -d \
  --name stats-test \
  alpine \
  sleep 300
```

실행 중인 컨테이너를 확인했습니다.

```bash
docker ps
```

이후 `docker stats` 명령으로 컨테이너의 CPU 및 메모리 사용량을 확인했습니다.

```bash
docker stats --no-stream
```

`--no-stream` 옵션을 사용하면 리소스 사용량을 한 번만 출력한 뒤 명령이 종료됩니다.

![Docker 리소스 사용량](./images/docker-practice/docker-stats.png)

주요 확인 항목은 다음과 같습니다.

- CPU 사용률
- 메모리 사용량
- 네트워크 입출력
- 디스크 입출력
- 프로세스 개수

### 6.10 컨테이너 중지 및 삭제

실행 중인 `stats-test` 컨테이너를 중지했습니다.

```bash
docker stop stats-test
```

중지된 컨테이너를 포함한 전체 목록을 확인했습니다.

```bash
docker ps -a
```

실습을 마친 컨테이너를 삭제했습니다.

```bash
docker rm stats-test
docker rm hello-world-test
```

삭제 결과를 다시 확인했습니다.

```bash
docker ps -a
```

컨테이너를 삭제해도 컨테이너 생성에 사용한 Docker 이미지는 자동으로 삭제되지 않습니다.

이미지는 다음 명령으로 별도로 확인할 수 있습니다.

```bash
docker images
```

### 6.11 이미지와 컨테이너의 차이

Docker 이미지와 컨테이너는 다음과 같은 차이가 있습니다.

| 구분 | Docker 이미지 | Docker 컨테이너 |
|---|---|---|
| 역할 | 컨테이너 생성에 사용하는 템플릿 | 이미지를 기반으로 생성된 실행 환경 |
| 상태 | 읽기 전용 | 실행 중 변경 가능 |
| 관계 | 하나의 이미지로 여러 컨테이너 생성 가능 | 특정 이미지를 기반으로 생성 |
| 삭제 | 컨테이너와 별도로 관리 | 삭제해도 이미지는 유지됨 |

`hello-world` 이미지를 내려받은 뒤 `hello-world-test` 컨테이너를 생성하면서 이미지와 컨테이너가 분리되어 관리된다는 점을 확인했습니다.

### 6.12 Docker 기본 점검 결과

이번 실습을 통해 다음 내용을 확인했습니다.

- Docker CLI와 Docker 엔진은 서로 다른 구성 요소입니다.
- Docker Desktop이 실행되어야 Docker 엔진에 연결할 수 있습니다.
- 이미지가 로컬에 없으면 Docker Hub에서 자동으로 다운로드합니다.
- Docker 이미지를 기반으로 컨테이너가 생성됩니다.
- 컨테이너의 메인 프로세스가 끝나면 컨테이너도 종료됩니다.
- 종료된 컨테이너도 삭제 전까지 로그와 실행 상태를 확인할 수 있습니다.
- `docker stats`를 통해 실행 중인 컨테이너의 자원 사용량을 확인할 수 있습니다.

## 7. Ubuntu 컨테이너 실행 및 접속 방식 비교

Ubuntu 컨테이너를 대화형 모드와 백그라운드 모드로 실행하고, `docker exec`와 `docker attach`를 이용해 컨테이너에 접속했습니다.

각 접속 방식에서 `exit`가 컨테이너 상태에 어떤 영향을 주는지 직접 확인했습니다.

### 7.1 Ubuntu 이미지 다운로드

Ubuntu 24.04 이미지를 Docker Hub에서 다운로드했습니다.

```bash
docker pull ubuntu:24.04
```

다운로드한 이미지가 로컬에 저장되었는지 확인했습니다.

```bash
docker images
```

![Ubuntu 이미지 확인](./images/ubuntu-practice/ubuntu-image.png)

### 7.2 대화형 Ubuntu 컨테이너 실행

`-it` 옵션을 사용하여 Ubuntu 컨테이너를 실행하고 내부 Bash 셸에 접속했습니다.

```bash
docker run -it \
  --name ubuntu-interactive \
  ubuntu:24.04 \
  bash
```

옵션의 의미는 다음과 같습니다.

| 옵션 | 의미 |
|---|---|
| `-i` | 표준 입력을 유지 |
| `-t` | 가상 터미널을 할당 |
| `--name` | 컨테이너 이름 지정 |

명령 실행 후 터미널 프롬프트가 다음과 같이 변경되었습니다.

```text
root@<container-id>:/#
```

이는 현재 명령이 macOS가 아니라 Ubuntu 컨테이너 내부에서 실행되고 있다는 의미입니다.

### 7.3 컨테이너 내부 환경 확인

컨테이너 내부에서 현재 위치와 파일 목록, 운영체제 및 CPU 아키텍처를 확인했습니다.

```bash
pwd
ls -la
echo "Hello from Ubuntu container"
cat /etc/os-release
uname -m
```

주요 출력 결과는 다음과 같습니다.

```text
/
Hello from Ubuntu container
```

`cat /etc/os-release` 결과를 통해 컨테이너 내부 운영체제가 Ubuntu임을 확인했습니다.

Apple Silicon Mac에서 ARM64 기반 Ubuntu 이미지를 실행했기 때문에 `uname -m` 결과는 다음과 같이 출력되었습니다.

```text
aarch64
```

![Ubuntu 컨테이너 내부 확인](./images/ubuntu-practice/ubuntu-inside.png)

### 7.4 대화형 컨테이너 종료

컨테이너 내부에서 `exit`를 입력했습니다.

```bash
exit
```

macOS 터미널로 돌아온 뒤 컨테이너 상태를 확인했습니다.

```bash
docker ps
docker ps -a
```

`docker ps`에는 컨테이너가 표시되지 않았지만, `docker ps -a`에서는 `ubuntu-interactive` 컨테이너가 종료된 상태로 표시되었습니다.

```text
Exited (0)
```

![대화형 컨테이너 종료 확인](./images/ubuntu-practice/interactive-exit.png)

이번 컨테이너에서는 `bash`가 메인 프로세스였습니다. 따라서 Bash에서 `exit`를 입력하자 메인 프로세스가 종료되었고, 컨테이너도 함께 종료되었습니다.

### 7.5 종료된 컨테이너 다시 실행

종료된 컨테이너를 새로 생성하지 않고 다시 시작했습니다.

```bash
docker start -ai ubuntu-interactive
```

옵션의 의미는 다음과 같습니다.

| 옵션 | 의미 |
|---|---|
| `-a` | 컨테이너의 표준 출력에 연결 |
| `-i` | 표준 입력을 유지 |

컨테이너 내부에서 다음 명령을 실행해 정상적으로 재시작되었는지 확인했습니다.

```bash
echo "Container restarted"
```

이후 다시 `exit`를 입력하여 컨테이너를 종료했습니다.

```bash
exit
```

### 7.6 백그라운드 Ubuntu 컨테이너 실행

이번에는 Ubuntu 컨테이너를 백그라운드에서 실행했습니다.

```bash
docker run -dit \
  --name ubuntu-background \
  ubuntu:24.04 \
  bash
```

옵션의 의미는 다음과 같습니다.

| 옵션 | 의미 |
|---|---|
| `-d` | 컨테이너를 백그라운드에서 실행 |
| `-i` | 표준 입력을 유지 |
| `-t` | 가상 터미널을 할당 |

실행 중인 컨테이너를 확인했습니다.

```bash
docker ps
```

`ubuntu-background` 컨테이너가 `Up` 상태로 표시되는 것을 확인했습니다.

![백그라운드 컨테이너 실행](./images/ubuntu-practice/background-running.png)

### 7.7 `docker exec`를 이용한 접속

`docker exec` 명령으로 실행 중인 컨테이너 내부에 새로운 Bash 프로세스를 실행했습니다.

```bash
docker exec -it ubuntu-background bash
```

컨테이너 내부에서 다음 명령을 실행했습니다.

```bash
echo "Connected with docker exec"
pwd
ls -la
```

이후 `exit`를 입력해 Bash에서 빠져나왔습니다.

```bash
exit
```

macOS 터미널에서 컨테이너 상태를 다시 확인했습니다.

```bash
docker ps
```

`docker exec`로 실행한 Bash에서는 `exit`를 입력했지만, `ubuntu-background` 컨테이너는 계속 `Up` 상태를 유지했습니다.

![docker exec 접속](./images/ubuntu-practice/docker-exec.png)

`docker exec`는 컨테이너의 메인 프로세스에 연결하는 것이 아니라, 컨테이너 내부에 별도의 프로세스를 추가로 실행합니다.

따라서 `docker exec`로 실행한 Bash가 종료되어도 컨테이너의 메인 프로세스는 계속 실행됩니다.

### 7.8 `docker attach`를 이용한 접속

`docker attach` 명령으로 실행 중인 컨테이너의 메인 프로세스에 직접 연결했습니다.

```bash
docker attach ubuntu-background
```

컨테이너 내부에서 다음 명령을 실행했습니다.

```bash
echo "Connected with docker attach"
```

```text
Connected with docker attach
```

![docker attach 접속](./images/ubuntu-practice/docker-attach.png)

`docker attach`는 컨테이너 내부에 새로운 프로세스를 생성하는 것이 아니라, 현재 실행 중인 메인 프로세스의 표준 입력과 출력에 직접 연결합니다.

### 7.9 `docker attach`에서 `exit` 실행 결과

`docker attach`로 연결된 상태에서 `exit`를 입력했습니다.

```bash
exit
```

이후 컨테이너 상태를 확인했습니다.

```bash
docker ps
```

```text
CONTAINER ID   IMAGE   COMMAND   CREATED   STATUS   PORTS   NAMES
```

실행 중인 컨테이너 목록이 비어 있는 것을 확인했습니다.

`ubuntu-background` 컨테이너의 메인 프로세스는 `bash`였습니다. `docker attach`는 이 메인 Bash에 직접 연결하므로, `exit`를 입력하자 메인 프로세스가 종료되었고 컨테이너도 함께 종료되었습니다.

종료된 컨테이너를 포함한 전체 목록은 다음 명령으로 확인했습니다.

```bash
docker ps -a --filter "name=ubuntu-background"
```

### 7.10 컨테이너를 종료하지 않고 `attach` 연결 해제

Docker의 기본 연결 해제 키는 다음과 같습니다.

```text
Control + P
Control + Q
```

하지만 VSCode 통합 터미널에서는 해당 키 조합이 단축키와 충돌하거나 입력이 제대로 전달되지 않을 수 있습니다.

따라서 `--detach-keys` 옵션을 사용해 연결 해제 키를 `Control + X`로 변경했습니다.

먼저 종료된 컨테이너를 다시 시작했습니다.

```bash
docker start ubuntu-background
```

사용자 지정 연결 해제 키를 지정하여 컨테이너에 연결했습니다.

```bash
docker attach \
  --detach-keys="ctrl-x" \
  ubuntu-background
```

컨테이너 내부에서 다음 명령을 실행했습니다.

```bash
echo "Connected with custom detach key"
```

이후 `Control + X`를 눌러 컨테이너를 종료하지 않고 연결만 해제했습니다.

macOS 터미널에서 컨테이너 상태를 확인했습니다.

```bash
docker ps
```

`ubuntu-background`가 계속 `Up` 상태로 표시되는 것을 통해 메인 프로세스를 종료하지 않고 연결만 해제된 것을 확인했습니다.

### 7.11 `docker exec`와 `docker attach` 비교

| 구분 | `docker exec` | `docker attach` |
|---|---|---|
| 연결 방식 | 컨테이너 내부에 새 프로세스 실행 | 실행 중인 메인 프로세스에 직접 연결 |
| Bash 실행 | 새로운 Bash 프로세스 생성 | 기존 메인 Bash 사용 |
| `exit` 실행 결과 | 추가 Bash만 종료 | 메인 Bash와 컨테이너가 함께 종료될 수 있음 |
| 컨테이너 유지 여부 | 일반적으로 유지됨 | 메인 프로세스 종료 시 컨테이너도 종료됨 |
| 주요 용도 | 컨테이너 내부 점검 및 명령 실행 | 메인 프로세스의 입출력 확인 |

실행 중인 컨테이너 내부를 점검하거나 명령을 실행할 때는 메인 프로세스에 영향을 주지 않는 `docker exec`가 더 안전하다는 점을 확인했습니다.

## 8. Ubuntu 컨테이너 트러블슈팅

### 8.1 동일한 컨테이너 이름 사용으로 인한 충돌

#### 문제

다음 명령으로 `ubuntu-background` 컨테이너를 생성하려고 했습니다.

```bash
docker run -dit \
  --name ubuntu-background \
  ubuntu:24.04 \
  bash
```

하지만 다음 오류가 발생했습니다.

```text
Conflict. The container name "/ubuntu-background" is already in use.
You have to remove (or rename) that container to be able to reuse that name.
```

#### 원인 가설

이전에 생성했던 `ubuntu-background` 컨테이너가 종료되었거나 실행 중인 상태로 남아 있어 동일한 이름을 다시 사용할 수 없는 것으로 판단했습니다.

#### 확인

종료된 컨테이너를 포함하여 해당 이름을 사용하는 컨테이너를 확인했습니다.

```bash
docker ps -a --filter "name=ubuntu-background"
```

기존 `ubuntu-background` 컨테이너가 존재하는 것을 확인했습니다.

#### 해결

기존 컨테이너를 계속 사용하기 위해 다음 명령으로 다시 시작했습니다.

```bash
docker start ubuntu-background
```

컨테이너 내부 접속은 `docker exec`를 이용했습니다.

```bash
docker exec -it ubuntu-background bash
```

기존 컨테이너가 필요하지 않은 경우에는 다음 명령으로 삭제한 뒤 같은 이름을 다시 사용할 수 있습니다.

```bash
docker rm -f ubuntu-background
```

#### 결과

기존 컨테이너를 정상적으로 다시 실행하고 내부에 접속할 수 있었습니다.

Docker에서는 실행 상태와 관계없이 존재하는 컨테이너의 이름을 중복해서 사용할 수 없다는 점을 확인했습니다.

### 8.2 `docker attach`에서 `exit` 후 컨테이너 종료

#### 문제

`docker attach`로 접속한 뒤 `exit`를 입력하자 `ubuntu-background` 컨테이너가 실행 중인 목록에서 사라졌습니다.

```bash
docker attach ubuntu-background
```

```bash
exit
```

```bash
docker ps
```

#### 원인 가설

`docker attach`가 컨테이너 내부에 새로운 Bash를 실행하는 것이 아니라, 컨테이너의 메인 Bash 프로세스에 직접 연결하기 때문이라고 판단했습니다.

#### 확인

종료된 컨테이너를 포함한 전체 목록을 확인했습니다.

```bash
docker ps -a --filter "name=ubuntu-background"
```

`ubuntu-background` 컨테이너가 `Exited` 상태인 것을 확인했습니다.

#### 해결

컨테이너를 다시 실행했습니다.

```bash
docker start ubuntu-background
```

VSCode 통합 터미널에서 기본 연결 해제 키가 원활하게 동작하지 않을 수 있어 사용자 지정 연결 해제 키를 사용했습니다.

```bash
docker attach \
  --detach-keys="ctrl-x" \
  ubuntu-background
```

컨테이너 내부에서 `exit`를 입력하지 않고 `Control + X`를 눌러 연결만 해제했습니다.

#### 결과

다시 `docker ps`를 실행했을 때 `ubuntu-background` 컨테이너가 계속 `Up` 상태를 유지했습니다.

이번 실습을 통해 `docker attach`에서 `exit`를 입력하는 것과 연결만 해제하는 것은 서로 다른 동작임을 확인했습니다.