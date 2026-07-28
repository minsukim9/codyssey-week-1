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