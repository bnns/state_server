### StateServer Versions

## 0.1

- first implementation
- compatibility with gen_statem style function outputs
- completion of documentation.

### 0.1.1

- actually push latest to master.
- minor documentation touchup
- enable documentation code links
- add licensing document

### 0.1.2

- fix bug where it fails to compile when it's a mix dependency

### 0.1.3

- fix child_spec/2 bug

### 0.1.4

- implementation of timeout on startup
- implemented transition cancellation
- made guards optional callbacks
- other cosmetic changes

## 0.2

- organization of function definitions by state

## 0.2.1

- better support for named timeouts

## 0.2.2

- does child_spec/1 correctly (OTP is hard!)

## 0.3.0

- support for on_state_entry/3

## 0.3.1

- fixed defstate/2

## 0.3.2

- fixed translation of on_entry action clauses

## 0.4.0

- added documentation on the uniqueness of `state_timeout`s
- fixed compilation concurrency issue by `requiring` all external state modules.
- renamed from `is_edge/3` to `is_transition/3` and added `is_transition/2`.
- renamed `is_terminal_transition/2` to `is_terminal/2`.

## 0.4.1

- added capability to add events to the `:defer` directive.

## 0.4.2

- make `on_state_entry/3` be called on init.

## 0.4.3

- support `state_timeout` and `event_timeout` options on init.

## 0.4.4

- deferred calls are passed the updated state.

## 0.4.5

- default to not using a proxy process for timeout calls (consistent with `GenServer`)

### Unscheduled

- `on_data_update/4` special callback
- better compatibility with gen_statem modules by providing `handle_event/3`
