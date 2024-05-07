{
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0irbdwkkjwzajq1ip6ba46q49sxnrl2cw7ddkdhsfhb6aprnm3vr";
      type = "gem";
    };
    version = "2.8.6";
  };
  adsf = {
    dependencies = ["rack" "rackup"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02aq8802pipig9058abhscj4vgx90qvg22bwzvpvp69vhf8hypak";
      type = "gem";
    };
    version = "1.5.0";
  };
  base64 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01qml0yilb9basf7is2614skjp8384h2pycfx86cr8023arfj98g";
      type = "gem";
    };
    version = "0.2.0";
  };
  coderay = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jvxqxzply1lwp7ysn94zjhh57vc14mcshw1ygw14ib8lhc00lyw";
      type = "gem";
    };
    version = "1.1.3";
  };
  colored = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b0x5jmsyi0z69bm6sij1k89z7h0laag3cb4mdn7zkl9qmxb90lx";
      type = "gem";
    };
    version = "1.2";
  };
  concurrent-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qh1b14jwbbj242klkyz5fc7npd4j0mvndz62gajhvl1l3wd7zc2";
      type = "gem";
    };
    version = "1.2.3";
  };
  cri = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bhsgnjav94mz5vf3305gxz1g34gm9kxvnrn1dkz530r8bpj0hr5";
      type = "gem";
    };
    version = "2.15.11";
  };
  ddmetrics = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01pd19xi121q15rxccimankzy2jp5w7h7iv0nziz1hn6174fnlgc";
      type = "gem";
    };
    version = "1.1.0";
  };
  ddplugin = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14hbvr6qjcn1i6pin8rq9kr02f98imskhrl8k53117mlfxxhl9sv";
      type = "gem";
    };
    version = "1.0.3";
  };
  diff-lcs = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1znxccz83m4xgpd239nyqxlifdb7m8rlfayk6s259186nkgj6ci7";
      type = "gem";
    };
    version = "1.5.1";
  };
  immutable-ruby = {
    dependencies = ["concurrent-ruby" "sorted_set"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rq58r59m2l36qf5l34pn3va47aihyz2kpf3vlhzxhy8v7h9df0s";
      type = "gem";
    };
    version = "0.2.0";
  };
  json_schema = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nzcnb9j7bbj3nc6izwlsxky8j4xly345qzfg5v5n6550kqfmqfn";
      type = "gem";
    };
    version = "0.21.0";
  };
  memo_wise = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ygvh67rg0isj0k4k7yq09ax614487lrx6p73pxs8wysd2f6bys7";
      type = "gem";
    };
    version = "1.8.0";
  };
  method_source = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1igmc3sq9ay90f8xjvfnswd1dybj1s3fi0dwd53inwsvqk4h24qq";
      type = "gem";
    };
    version = "1.1.0";
  };
  nanoc = {
    dependencies = ["addressable" "colored" "nanoc-checking" "nanoc-cli" "nanoc-core" "nanoc-deploying" "parallel" "tty-command" "tty-which"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1niyiya63b03y5zhnhxiwnbrnl3gdzdpdpqdp6q3dxh5min79rka";
      type = "gem";
    };
    version = "4.12.21";
  };
  nanoc-checking = {
    dependencies = ["nanoc-cli" "nanoc-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0si4ag5dxdqhg3lxhhglym74pzlz9z75yb20j4nccq45njlm1ihg";
      type = "gem";
    };
    version = "1.0.5";
  };
  nanoc-cli = {
    dependencies = ["cri" "diff-lcs" "nanoc-core" "pry" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i9crkhh0n3qglv14c6qax481drg0han3sfb59r9c5a3d083ndq6";
      type = "gem";
    };
    version = "4.12.21";
  };
  nanoc-core = {
    dependencies = ["base64" "concurrent-ruby" "ddmetrics" "ddplugin" "immutable-ruby" "json_schema" "memo_wise" "psych" "slow_enumerator_tools" "tty-platform" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fmm916r0x8ms1852mmmavqhg5d0al87gv0azwbvqid1yzcia82a";
      type = "gem";
    };
    version = "4.12.21";
  };
  nanoc-deploying = {
    dependencies = ["nanoc-checking" "nanoc-cli" "nanoc-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05s3aqdb7li97lzj5qpak8iac2nfhggv5s23wmzmgzm16c7fkcw9";
      type = "gem";
    };
    version = "1.0.2";
  };
  parallel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15wkxrg1sj3n1h2g8jcrn7gcapwcgxr659ypjf75z1ipkgxqxwsv";
      type = "gem";
    };
    version = "1.24.0";
  };
  pastel = {
    dependencies = ["tty-color"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xash2gj08dfjvq4hy6l1z22s5v30fhizwgs10d6nviggpxsj7a8";
      type = "gem";
    };
    version = "0.8.0";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k9kqkd9nps1w1r1rb7wjr31hqzkka2bhi8b518x78dcxppm9zn4";
      type = "gem";
    };
    version = "0.14.2";
  };
  psych = {
    dependencies = ["stringio"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s5383m6004q76xm3lb732bp4sjzb6mxb6rbgn129gy2izsj4wrk";
      type = "gem";
    };
    version = "5.1.2";
  };
  public_suffix = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14y4vzjwf5gp0mqgs880kis0k7n2biq8i6ci6q2n315kichl1hvj";
      type = "gem";
    };
    version = "5.0.5";
  };
  rack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0x3mijjklsrlzfmwqp7x58fla7sk8pfwijhk988nmba787r8rf9g";
      type = "gem";
    };
    version = "3.0.10";
  };
  rackup = {
    dependencies = ["rack" "webrick"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kbcka30g681cqasw47pq93fxjscq7yvs5zf8lp3740rb158ijvf";
      type = "gem";
    };
    version = "2.1.0";
  };
  rbtree = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1z0h1x7fpkzxamnvbw1nry64qd6n0nqkwprfair29z94kd3a9vhl";
      type = "gem";
    };
    version = "0.4.6";
  };
  rugged = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dld1z2mdnsf9i4fs74zdr6rfk75pkgzvvyxask5w2dsmkj7bb4m";
      type = "gem";
    };
    version = "1.1.1";
  };
  set = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15vmxa781w2983k5gi8wrirsva6hgbvfxfp57jxs2n8j7gr3l8sp";
      type = "gem";
    };
    version = "1.1.0";
  };
  slow_enumerator_tools = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0phfj4jxymxf344cgksqahsgy83wfrwrlr913mrsq2c33j7mj6p6";
      type = "gem";
    };
    version = "1.1.0";
  };
  sorted_set = {
    dependencies = ["rbtree" "set"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0brpwv68d7m9qbf5js4bg8bmg4v7h4ghz312jv9cnnccdvp8nasg";
      type = "gem";
    };
    version = "1.0.3";
  };
  stringio = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "063psvsn1aq6digpznxfranhcpmi0sdv2jhra5g0459sw0x2dxn1";
      type = "gem";
    };
    version = "3.1.0";
  };
  tty-color = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0aik4kmhwwrmkysha7qibi2nyzb4c8kp42bd5vxnf8sf7b53g73g";
      type = "gem";
    };
    version = "0.6.0";
  };
  tty-command = {
    dependencies = ["pastel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14hi8xiahfrrnydw6g3i30lxvvz90wp4xsrlhx8mabckrcglfv0c";
      type = "gem";
    };
    version = "0.10.1";
  };
  tty-platform = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02h58a8yg2kzybhqqrhh4lfdl9nm0i62nd9jrvwinjp802qkffg2";
      type = "gem";
    };
    version = "0.3.0";
  };
  tty-which = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rpljdwlfm4qgps2xvq6306w86fm057m89j4gizcji371mgha92q";
      type = "gem";
    };
    version = "0.5.0";
  };
  webrick = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13qm7s0gr2pmfcl7dxrmq38asaza4w0i2n9my4yzs499j731wh8r";
      type = "gem";
    };
    version = "1.8.1";
  };
  zeitwerk = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1m67qmsak3x8ixs8rb971azl3l7wapri65pmbf5z886h46q63f1d";
      type = "gem";
    };
    version = "2.6.13";
  };
}
