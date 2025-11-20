## Build & Push Docker Images (Mac M2/M3/M4) + Singularity

### 1. Build Docker Image on Mac (Apple Silicon)

Make sure your `Dockerfile` is in the current directory.

```bash
docker buildx build --platform linux/amd64 -t <username>/<software>:<version> .
````

Example:

```bash
docker buildx build --platform linux/amd64 -t sjiang/bwa:0.7.17 .
```

---

### 2. Push Image to Docker Hub

Login:

```bash
docker login
```

Push:

```bash
docker push <username>/<software>:<version>
```

---

### 3. Pull Image & Run Container Locally

Pull:

```bash
docker pull <username>/<software>:<version>
```

Run interactively:

```bash
docker run -it --name <container_name> <username>/<software>:<version> /bin/bash
```

Example:

```bash
docker run -it --name bwa_test sjiang/bwa:0.7.17 /bin/bash
```

---

### 4. Create Singularity `.sif` Image (on HPC)

Pull directly from Docker Hub:

```bash
singularity pull <software>-<version>.sif docker://<username>/<software>:<version>
```

Example:

```bash
singularity pull bwa-0.7.17.sif docker://sjiang/bwa:0.7.17
```

---
