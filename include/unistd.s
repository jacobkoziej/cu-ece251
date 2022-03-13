/*
 * unistd.s -- arm64 system call numbers
 * Copyright (C) 2022  Jacob Koziej <jacobkoziej@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

.equ sys_io_setup,                0
.equ sys_io_destroy,              1
.equ sys_io_submit,               2
.equ sys_io_cancel,               3
.equ sys_io_getevents,            4
.equ sys_setxattr,                5
.equ sys_lsetxattr,               6
.equ sys_fsetxattr,               7
.equ sys_getxattr,                8
.equ sys_lgetxattr,               9
.equ sys_fgetxattr,               10
.equ sys_listxattr,               11
.equ sys_llistxattr,              12
.equ sys_flistxattr,              13
.equ sys_removexattr,             14
.equ sys_lremovexattr,            15
.equ sys_fremovexattr,            16
.equ sys_getcwd,                  17
.equ sys_lookup_dcookie,          18
.equ sys_eventfd2,                19
.equ sys_epoll_create1,           20
.equ sys_epoll_ctl,               21
.equ sys_epoll_pwait,             22
.equ sys_dup,                     23
.equ sys_dup3,                    24
.equ sys_fcntl,                   25
.equ sys_inotify_init1,           26
.equ sys_inotify_add_watch,       27
.equ sys_inotify_rm_watch,        28
.equ sys_ioctl,                   29
.equ sys_ioprio_set,              30
.equ sys_ioprio_get,              31
.equ sys_flock,                   32
.equ sys_mknodat,                 33
.equ sys_mkdirat,                 34
.equ sys_unlinkat,                35
.equ sys_symlinkat,               36
.equ sys_linkat,                  37
.equ sys_renameat,                38
.equ sys_umount2,                 39
.equ sys_mount,                   40
.equ sys_pivot_root,              41
.equ sys_nfsservctl,              42
.equ sys_statfs,                  43
.equ sys_fstatfs,                 44
.equ sys_truncate,                45
.equ sys_ftruncate,               46
.equ sys_fallocate,               47
.equ sys_faccessat,               48
.equ sys_chdir,                   49
.equ sys_fchdir,                  50
.equ sys_chroot,                  51
.equ sys_fchmod,                  52
.equ sys_fchmodat,                53
.equ sys_fchownat,                54
.equ sys_fchown,                  55
.equ sys_openat,                  56
.equ sys_close,                   57
.equ sys_vhangup,                 58
.equ sys_pipe2,                   59
.equ sys_quotactl,                60
.equ sys_getdents64,              61
.equ sys_lseek,                   62
.equ sys_read,                    63
.equ sys_write,                   64
.equ sys_readv,                   65
.equ sys_writev,                  66
.equ sys_pread64,                 67
.equ sys_pwrite64,                68
.equ sys_preadv,                  69
.equ sys_pwritev,                 70
.equ sys_sendfile,                71
.equ sys_pselect6,                72
.equ sys_ppoll,                   73
.equ sys_signalfd4,               74
.equ sys_vmsplice,                75
.equ sys_splice,                  76
.equ sys_tee,                     77
.equ sys_readlinkat,              78
.equ sys_newfstatat,              79
.equ sys_fstat,                   80
.equ sys_sync,                    81
.equ sys_fsync,                   82
.equ sys_fdatasync,               83
.equ sys_sync_file_range,         84
.equ sys_timerfd_create,          85
.equ sys_timerfd_settime,         86
.equ sys_timerfd_gettime,         87
.equ sys_utimensat,               88
.equ sys_acct,                    89
.equ sys_capget,                  90
.equ sys_capset,                  91
.equ sys_personality,             92
.equ sys_exit,                    93
.equ sys_exit_group,              94
.equ sys_waitid,                  95
.equ sys_set_tid_address,         96
.equ sys_unshare,                 97
.equ sys_futex,                   98
.equ sys_set_robust_list,         99
.equ sys_get_robust_list,         100
.equ sys_nanosleep,               101
.equ sys_getitimer,               102
.equ sys_setitimer,               103
.equ sys_kexec_load,              104
.equ sys_init_module,             105
.equ sys_delete_module,           106
.equ sys_timer_create,            107
.equ sys_timer_gettime,           108
.equ sys_timer_getoverrun,        109
.equ sys_timer_settime,           110
.equ sys_timer_delete,            111
.equ sys_clock_settime,           112
.equ sys_clock_gettime,           113
.equ sys_clock_getres,            114
.equ sys_clock_nanosleep,         115
.equ sys_syslog,                  116
.equ sys_ptrace,                  117
.equ sys_sched_setparam,          118
.equ sys_sched_setscheduler,      119
.equ sys_sched_getscheduler,      120
.equ sys_sched_getparam,          121
.equ sys_sched_setaffinity,       122
.equ sys_sched_getaffinity,       123
.equ sys_sched_yield,             124
.equ sys_sched_get_priority_max,  125
.equ sys_sched_get_priority_min,  126
.equ sys_sched_rr_get_interval,   127
.equ sys_restart_syscall,         128
.equ sys_kill,                    129
.equ sys_tkill,                   130
.equ sys_tgkill,                  131
.equ sys_sigaltstack,             132
.equ sys_rt_sigsuspend,           133
.equ sys_rt_sigaction,            134
.equ sys_rt_sigprocmask,          135
.equ sys_rt_sigpending,           136
.equ sys_rt_sigtimedwait,         137
.equ sys_rt_sigqueueinfo,         138
.equ sys_rt_sigreturn,            139
.equ sys_setpriority,             140
.equ sys_getpriority,             141
.equ sys_reboot,                  142
.equ sys_setregid,                143
.equ sys_setgid,                  144
.equ sys_setreuid,                145
.equ sys_setuid,                  146
.equ sys_setresuid,               147
.equ sys_getresuid,               148
.equ sys_setresgid,               149
.equ sys_getresgid,               150
.equ sys_setfsuid,                151
.equ sys_setfsgid,                152
.equ sys_times,                   153
.equ sys_setpgid,                 154
.equ sys_getpgid,                 155
.equ sys_getsid,                  156
.equ sys_setsid,                  157
.equ sys_getgroups,               158
.equ sys_setgroups,               159
.equ sys_uname,                   160
.equ sys_sethostname,             161
.equ sys_setdomainname,           162
.equ sys_getrlimit,               163
.equ sys_setrlimit,               164
.equ sys_getrusage,               165
.equ sys_umask,                   166
.equ sys_prctl,                   167
.equ sys_getcpu,                  168
.equ sys_gettimeofday,            169
.equ sys_settimeofday,            170
.equ sys_adjtimex,                171
.equ sys_getpid,                  172
.equ sys_getppid,                 173
.equ sys_getuid,                  174
.equ sys_geteuid,                 175
.equ sys_getgid,                  176
.equ sys_getegid,                 177
.equ sys_gettid,                  178
.equ sys_sysinfo,                 179
.equ sys_mq_open,                 180
.equ sys_mq_unlink,               181
.equ sys_mq_timedsend,            182
.equ sys_mq_timedreceive,         183
.equ sys_mq_notify,               184
.equ sys_mq_getsetattr,           185
.equ sys_msgget,                  186
.equ sys_msgctl,                  187
.equ sys_msgrcv,                  188
.equ sys_msgsnd,                  189
.equ sys_semget,                  190
.equ sys_semctl,                  191
.equ sys_semtimedop,              192
.equ sys_semop,                   193
.equ sys_shmget,                  194
.equ sys_shmctl,                  195
.equ sys_shmat,                   196
.equ sys_shmdt,                   197
.equ sys_socket,                  198
.equ sys_socketpair,              199
.equ sys_bind,                    200
.equ sys_listen,                  201
.equ sys_accept,                  202
.equ sys_connect,                 203
.equ sys_getsockname,             204
.equ sys_getpeername,             205
.equ sys_sendto,                  206
.equ sys_recvfrom,                207
.equ sys_setsockopt,              208
.equ sys_getsockopt,              209
.equ sys_shutdown,                210
.equ sys_sendmsg,                 211
.equ sys_recvmsg,                 212
.equ sys_readahead,               213
.equ sys_brk,                     214
.equ sys_munmap,                  215
.equ sys_mremap,                  216
.equ sys_add_key,                 217
.equ sys_request_key,             218
.equ sys_keyctl,                  219
.equ sys_clone,                   220
.equ sys_execve,                  221
.equ sys_mmap,                    222
.equ sys_fadvise64,               223
.equ sys_swapon,                  224
.equ sys_swapoff,                 225
.equ sys_mprotect,                226
.equ sys_msync,                   227
.equ sys_mlock,                   228
.equ sys_munlock,                 229
.equ sys_mlockall,                230
.equ sys_munlockall,              231
.equ sys_mincore,                 232
.equ sys_madvise,                 233
.equ sys_remap_file_pages,        234
.equ sys_mbind,                   235
.equ sys_get_mempolicy,           236
.equ sys_set_mempolicy,           237
.equ sys_migrate_pages,           238
.equ sys_move_pages,              239
.equ sys_rt_tgsigqueueinfo,       240
.equ sys_perf_event_open,         241
.equ sys_accept4,                 242
.equ sys_recvmmsg,                243
.equ sys_arch_specific_syscall,   244
.equ sys_wait4,                   260
.equ sys_prlimit64,               261
.equ sys_fanotify_init,           262
.equ sys_fanotify_mark,           263
.equ sys_name_to_handle_at,       264
.equ sys_open_by_handle_at,       265
.equ sys_clock_adjtime,           266
.equ sys_syncfs,                  267
.equ sys_setns,                   268
.equ sys_sendmmsg,                269
.equ sys_process_vm_readv,        270
.equ sys_process_vm_writev,       271
.equ sys_kcmp,                    272
.equ sys_finit_module,            273
.equ sys_sched_setattr,           274
.equ sys_sched_getattr,           275
.equ sys_renameat2,               276
.equ sys_seccomp,                 277
.equ sys_getrandom,               278
.equ sys_memfd_create,            279
.equ sys_bpf,                     280
.equ sys_execveat,                281
.equ sys_userfaultfd,             282
.equ sys_membarrier,              283
.equ sys_mlock2,                  284
.equ sys_copy_file_range,         285
.equ sys_preadv2,                 286
.equ sys_pwritev2,                287
.equ sys_pkey_mprotect,           288
.equ sys_pkey_alloc,              289
.equ sys_pkey_free,               290
.equ sys_statx,                   291
.equ sys_io_pgetevents,           292
.equ sys_rseq,                    293
.equ sys_kexec_file_load,         294
.equ sys_pidfd_send_signal,       424
.equ sys_io_uring_setup,          425
.equ sys_io_uring_enter,          426
.equ sys_io_uring_register,       427
.equ sys_open_tree,               428
.equ sys_move_mount,              429
.equ sys_fsopen,                  430
.equ sys_fsconfig,                431
.equ sys_fsmount,                 432
.equ sys_fspick,                  433
.equ sys_pidfd_open,              434
.equ sys_clone3,                  435
.equ sys_close_range,             436
.equ sys_openat2,                 437
.equ sys_pidfd_getfd,             438
.equ sys_faccessat2,              439
.equ sys_process_madvise,         440
.equ sys_epoll_pwait2,            441
.equ sys_mount_setattr,           442
.equ sys_quotactl_fd,             443
.equ sys_landlock_create_ruleset, 444
.equ sys_landlock_add_rule,       445
.equ sys_landlock_restrict_self,  446
.equ sys_memfd_secret,            447
.equ sys_process_mrelease,        448
.equ sys_futex_waitv,             449
.equ sys_set_mempolicy_home_node, 450
.equ sys_syscalls,                451
