# scalar-cfssl

## How to build a Docker image

```console
./build.sh
```

To publish the image, run `docker push ghcr.io/scalar-labs/scalar-cfssl:<tag>`.
Here `<tag>` should match the `SCALAR_CFSSL_IMAGE_TAG` value in `build.sh`.
